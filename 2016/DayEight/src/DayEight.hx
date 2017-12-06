package ;

import display.*;

using StringTools;

class DayEight {
  //private static inline var inputPath:String = "inputTest.txt";
  private static inline var inputPath:String = "input.txt";
  private static var input:String = "";

  static public function main() {
    input = sys.io.File.getContent(inputPath).trim();

    //var screen:LCD = new LCD(7, 3);
    var screen:LCD = new LCD(50, 6);

    screen.decode(input);
    screen.display();
    trace(screen.countLitPixels());
  }
}
