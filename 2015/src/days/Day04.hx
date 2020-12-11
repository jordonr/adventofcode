package days;

import haxe.crypto.Md5;

using haxe.Int64;

class Day04 {
	public function new(data:String) {
		Sys.println('Part 1: ' + partOne(data, "00000"));
		Sys.println('Part 2: ' + partOne(data, "000000"));
	}

	private function partOne(data:String, match:String):Int64 {
		var num:Int = 0;
		var hash:String = "";

		while (hash.substr(0, match.length) != match) {
			num++;
			hash = Md5.encode(data + num);
		}

		return num;
	}
}
