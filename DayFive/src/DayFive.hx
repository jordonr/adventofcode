package ;

import haxe.crypto.Md5;

class DayFive {
  private static inline var doorID:String = "abc";

  static public function main() {
    trace( Md5.encode(doorID) );
  }
}
//900150983cd24fb0d6963f7d28e17f72
