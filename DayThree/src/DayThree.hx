package ;

import parsers.*;

using StringTools;

class DayThree {
  private static inline var inputPath:String = "input.txt";
  //private static inline var inputPath:String = "inputTest.txt";
  private static var input:String = "";

  static public function main() {
    input = sys.io.File.getContent(inputPath).trim();

    var row:Rows = new Rows(input);
    var column:Columns = new Columns(input);
    trace(row.parse());
    trace(column.parse());

  }
}
