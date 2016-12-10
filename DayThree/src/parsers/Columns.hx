package parsers;

using StringTools;

class Columns extends Rows {

  private var transposeLines:Array<Array<Int>> = [];

  public override function parse() : Int {
    var gridLines:Array<Array<Int>> = gridify();

    for(gl in gridLines) {
  		var i:Int = 0;
  		while(i < gl.length) {
  			possible += isTriangle([gl[i],gl[i+1],gl[i+2]]);
  			i=i+3;
  		}
  	}

  	return possible;
  }

  public function gridify() : Array<Array<Int>> {
    var numbers2d:Array<Array<Int>> = [];
    var row:Array<Int> = [];
    var tranposed:Array<Array<Int>> = [];

    for(line in lines) {
      row = [];
      fields = splitFields.split(line.trim());

      for(field in fields) {
        row.push(Std.parseInt(field));
      }

      numbers2d.push(row);
  	}

  	for(j in 0...3) {
  	  tranposed[j] = [];

  	  for(i in 0...numbers2d.length) {
  		tranposed[j].push(numbers2d[i][j]);
  	  }
  	}

  	return tranposed;
  }

}
