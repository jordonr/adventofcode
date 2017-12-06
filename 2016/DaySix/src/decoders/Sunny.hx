package decoders;

class Sunny extends Scramble {

  private override function buildWord(totals:Array<Map<String, Int>>) : String {
    var word:String = "";
    var b:Int = 0;
    var c:String = "";

    for(l in letterCounts) {
      b = null;
      c = "";

      for(k in l.keys()) {

        if(l[k] < b || b == null) {
          b = l[k];
          c = k;
        }
      }
      word += c;
    }

    return word;

  }

}
