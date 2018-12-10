package ;

using StringTools;

class Day05 {
  private static inline var inputPath:String = "../inputs/Day5.txt";
//   private static inline var inputPath:String = "../inputs/Day5-Test.txt";
  private static var input:String = "";

  static public function main() {
    input = sys.io.File.getContent(inputPath).trim();

    var remainder:String = polyermize(input);

    trace(remainder.length);
  }

  private static function polyermize(polyString:String) : String {
      var retPoly:String = polyString;
      var beenMatched:Bool = false;
      for(c in 0...polyString.length-1) {
        if(polyString.charAt(c) == flipCase(polyString.charAt(c+1))) {
            var temp:String = polyString.charAt(c) + polyString.charAt(c+1);
            retPoly = StringTools.replace(retPoly, temp, "");
            beenMatched = true;
        }
      }

      if(beenMatched) {
          retPoly = polyermize(retPoly);
      }

      return retPoly;
  }

  private static function flipCase(char:String) : String {
      if(char.toUpperCase() == char) {
          return char.toLowerCase();
      } else {
          return char.toUpperCase();
      }
  }
}