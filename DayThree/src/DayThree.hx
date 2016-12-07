package ;

using StringTools;

class DayThree {
  private static inline var inputPath:String = "input.txt";
  //private static inline var inputPath:String = "inputTest.txt";
  private static var input:String = "";

  static public function main() {
    input = sys.io.File.getContent(inputPath).trim();
    var splitLine = ~/\n/g;
    var splitFields = ~/[\D]+/g;
    var fields:Array<Dynamic> = [];
    var sides:Array<Int> = [];
    var possible:Int = 0;

    var lines:Array<String> = splitLine.split(input);

    for(line in lines) {
      sides = [];
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

    trace(possible);
  }
}
