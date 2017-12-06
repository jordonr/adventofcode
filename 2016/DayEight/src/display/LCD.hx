package display;

using StringTools;

class LCD {
  private var splitLine = ~/\n/g;
  private var width:Int = 0;
  private var height:Int = 0;
  private var screen:Array<Array<String>> = [];
  private var lines:Array<String> = [];

  public function new( w:Int, h:Int ) : Void {
    this.width = w;
    this.height = h;

    for(i in 0...h) {
      screen[i] = [];
      for(j in 0...w) {
        screen[i][j] = '.';
      }
    }
  }

  public function display( ) : Void {
    neko.Lib.print("==========================================================\n");
    for(i in 0...width) {
      var s = Std.string(i);
      neko.Lib.print(s.charAt(s.length-1));
    }
    neko.Lib.print("\n");

    for(i in 0...height) {
      for(j in 0...width) {
        neko.Lib.print(screen[i][j]);
      }
      neko.Lib.print("\n");
    }
    neko.Lib.print("==========================================================\n");

  }

  public function decode( input:String ) : Void {
    lines = splitLine.split(input);

    for(line in lines) {
      var parts:Array<String> = line.trim().split(' ');
      trace(parts);

      if(parts[0] == 'rect') {
        var wxh = parts[1].split('x');
        createRect(Std.parseInt(wxh[0]), Std.parseInt(wxh[1]));
      } else if(parts[0] == 'rotate') {
        var loc:Int = Std.parseInt(parts[2].replace('x=', '').replace('y=', ''));
        var by:Int = Std.parseInt(parts[4]);

        if(parts[1] == 'column') {
          rotateCol(loc, by);
        } else if(parts[1] == 'row') {
          rotateRow(loc, by);
        }
      }

      display();

    }
  }

  public function countLitPixels() : Int {
    var lit:Int = 0;

    for(i in 0...screen.length) {
      for(j in 0...screen[i].length) {
        if(screen[i][j] == '#') {
          lit++;
        }
      }
    }

    return lit;
  }

  private function createRect( w:Int, h:Int ) : Void {
    for(i in 0...h) {
      for(j in 0...w) {
        screen[i][j] = '#';
      }
    }
  }

  private function rotateRow( row:Int, by:Int ) : Void {
    for(i in 0...by) {
      screen[row].unshift(screen[row].pop());
    }
  }

  private function rotateCol( col:Int, by:Int ) : Void {
    var column:Array<String> = [];

    for(i in 0...height) {
      column.push(screen[i][col]);
    }

    for(i in 0...by) {
      column.unshift(column.pop());
    }

    for(i in 0...height) {
      screen[i][col] = column[i];
    }
  }

}
