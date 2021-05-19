package decoders;

class Scramble {
  private var splitLine = ~/\n/g;
  private var lines:Array<String> = [];
  private var letterCounts:Array<Map<String, Int>> = [];

  public function new( input:String ) : Void {
    lines = splitLine.split(input);
  }

  public function decode() : String {
    for(l in 0...lines.length) {
      for(c in 0...lines[l].length) {
        var char = lines[l].charAt(c);

        if(letterCounts[c] != null) {
          if(letterCounts[c].exists(char)) {
            letterCounts[c].set(char, letterCounts[c].get(char) + 1);
          } else {
            letterCounts[c].set(char, 1);
          }
        } else {
          letterCounts[c] = new Map();
          letterCounts[c].set(char, 1);
        }

      }
    }

    return buildWord(letterCounts);
  }

  private function buildWord( totals:Array<Map<String, Int>> ) : String {
    var word:String = "";
    var b:Int = 0;
    var c:String = "";

    for(l in letterCounts) {
      b = 0;
      c = "";

      for(k in l.keys()) {
        if(l[k] > b) {
          b = l[k];
          c = k;
        }
      }
      word += c;
    }

    return word;

  }
}
