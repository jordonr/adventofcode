package ;

import decoders.*;

using StringTools;

class DaySix {
  private static inline var inputPath:String = "input.txt";
  //private static inline var inputPath:String = "inputTest.txt";
  private static var input:String = "";

  static public function main() {
    input = sys.io.File.getContent(inputPath).trim();

    var eggs:Scramble = new Scramble(input);
    trace(eggs.decode());

  }
}
