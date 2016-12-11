package decoders;

using StringTools;

class Room {
  private var splitLine = ~/\n/g;
  private var lineTester = ~/([a-z\-]*)([0-9]+)\[([a-z]+)\]/; //aaaaa-bbb-z-y-x-123[abxyz] => (aaaaa-bbb-z-y-x-)(123)[(abxyz)]
  private var sectorTotal:Int = 0;
  private var lines:Array<String> = [];
  private var alphabet:Array<String> = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];

  public function new(input) : Void {
    lines = splitLine.split(input);
    sectorTotal = 0;
  }

  public function decode() : Int {
    for(line in lines) {
      lineTester.match(line);
      var genCheck:String = this.genChecksum(lineTester.matched(1));
      if(genCheck == lineTester.matched(3)) {
        var sectorInt = Std.parseInt(lineTester.matched(2));
        this.sectorTotal += sectorInt;
        trace(sectorInt + " : " + lineTester.matched(1) + " > " + decryptName(lineTester.matched(1), sectorInt));
      }
    }

    return sectorTotal;
  }

  private function decryptName(roomCode:String, sector:Int) : String {
    //var wr = ~/\W/g;
    var newName:String = "";
     
    //roomCode = wr.replace(roomCode, " ");
    for(c in 0...roomCode.length) {
      newName = newName + shiftChar(roomCode.charCodeAt(c), sector);
    }
    
    return newName;
  }

  private function shiftChar(toon:Int, sector:Int) {
    var shift = sector % 26;
    var toonIndex = toon - 97 + shift;

    if(toonIndex > 25) {
      toonIndex = toonIndex - 26;
    }
    
    if(alphabet[toonIndex] == null) {
      return " ";
    }

    return alphabet[toonIndex];
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
