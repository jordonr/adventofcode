package parsers;

using StringTools;

class Rows {
  private var splitLine = ~/\n/g;
  private var splitFields = ~/[\D]+/g;
  private var fields:Array<Dynamic> = [];
  private var lines:Array<String> = [];
  private var possible:Int = 0;

  public function new(input) : Void{
    lines = splitLine.split(input);
    possible = 0;
  }

  public function parse() : Int {
    possible = 0;
    for(line in lines) {
      var sides:Array<Int> = [];
      fields = splitFields.split(line.trim());

      for(field in fields) {
        sides.push(Std.parseInt(field));
      }

      if(sides[0] + sides[1] > sides[2]) {
        if(sides[1] + sides[2] > sides[0]) {
          if(sides[2] + sides[0] > sides[1]) {
            possible++;
          }
        }
      }
    }

    return possible;
  }
  
  public function isTriangle(sides:Array<Int>) : Int {
    var addsUp = 0;
    if(sides[0] + sides[1] > sides[2]) {
	  if(sides[1] + sides[2] > sides[0]) {
	    if(sides[2] + sides[0] > sides[1]) {
		  addsUp = 1;
	    }
	  }
    }
  
    return addsUp;
  }

}
