package decoders;

using StringTools;

class Room {
  private var splitLine = ~/\n/g;
  private var lineTester = ~/([a-z\-]*)([0-9]+)\[([a-z]+)\]/; //aaaaa-bbb-z-y-x-123[abxyz] => (aaaaa-bbb-z-y-x-)(123)[(abxyz)]
  private var sectorTotal:Int = 0;
  private var lines:Array<String> = [];

  public function new(input) : Void {
    lines = splitLine.split(input);
    sectorTotal = 0;
  }

  public function decode() : Int {
    for(line in lines) {
      lineTester.match(line);
      var genCheck = this.genChecksum(lineTester.matched(1));
      if(genCheck == lineTester.matched(3)) {
        this.sectorTotal += Std.parseInt(lineTester.matched(2));
      }
    }

    return sectorTotal;
  }

  private function genChecksum(roomName:String) : String {
    var charCount:Map<String, Int> = new Map();
    var allSorted:Array<String> = [];
    var rr = ~/[^a-z]/g;
    var cleaned = rr.replace(roomName, "");

    for(i in 0...cleaned.length) {
      var c = cleaned.charAt(i);

      if(charCount.exists(c)) {
        charCount[c] = charCount[c] + 1;
      } else {
        charCount.set(c, 1);
      }
    }

    for(key in charCount.keys()) {
      allSorted.push(charCount[key] + key);
    }

    allSorted.sort(function(a:String, b:String) : Int {
      var a1 = a.substr(0, 1);
      var a2 = a.substr(1);
      var b1 = b.substr(0, 1);
      var b2 = b.substr(1);
      var r = 0;

      //sort descending by number, then alpha
      if (a1 < b1) r = 1;
      else if (a1 > b1) r = -1;
      else {
        if (a2 < b2) r = -1;
        else if (a2 > b2) r = 1;
      }
      return r;
    });

    return rr.replace(allSorted.join(""), "").substr(0, 5);
  }
}
