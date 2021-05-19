package days;

import haxe.crypto.Md5;

class Day05 {
	// private var doorID:String = "abc";
	private var doorID:String = "cxdnnyjw";

	public function new() {
		var passwordDoor1:String = "";
		var passwordDoor2:Array<String> = [for (i in 0...8) ""];
		var hash:String = "";
		var n:Int = 0;

		trace("Door 1:");
		while (passwordDoor1.length < 8) {
			hash = Md5.encode(doorID + n);
			if (hash.indexOf("00000") == 0) {
				passwordDoor1 = passwordDoor1 + hash.charAt(5);
				trace(passwordDoor1);
			}
			n++;
		}

		trace("Finished: " + passwordDoor1);

		trace("Door 2:");
		hash = "";
		n = 0;
		var count:Int = 0;
		while (count <= 7) {
			hash = Md5.encode(doorID + n);
			if (hash.indexOf("00000") == 0) {
				var i = Std.parseInt(hash.charAt(5));
				if (i != null && i < 8 && passwordDoor2[i] == "") {
					passwordDoor2[i] = hash.charAt(6);
					trace(passwordDoor2);
					count++;
				}
			}
			n++;
		}

		trace("Finished: " + passwordDoor2.join(""));
	}
}
