package ;

import parsers.*;

using StringTools;

class DaySeven {
  private static inline var inputPath:String = "input.txt";
  //private static inline var inputPath:String = "inputTest.txt";
  private static var input:String = "";

  static public function main() {
    input = sys.io.File.getContent(inputPath).trim();
    
    var ips:IP7 = new IP7(input);
    trace(ips.valid());
    
  }
}
