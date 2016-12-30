package ;

import keypads.*;

using StringTools;

class DayTwo {
  //private static inline var inputPath:String = "testInput.txt";
  private static inline var inputPath:String = "input.txt";
  private static var input:String = "";

  static public function main() {
    input = sys.io.File.getContent(inputPath).trim();
    var r = ~/\n/g;
    var lines:Array<String> = r.split(input);

    var square:Square = new Square();
    var diamon:Diamond = new Diamond();
    trace(square.start(lines));
    trace(diamon.start(lines));

  }
}
