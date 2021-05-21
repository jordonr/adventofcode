package days;

import haxe.io.Input;
import utils.ReadData;

using haxe.Int64;

class Day09 {
	public function new(path:String) {
		var input:String = ReadData.getFile(path);

		Sys.println("Part 1: " + part1(input));
		// input = "(27x12)(20x12)(13x14)(7x10)(1x12)A";
		Sys.println("Part 2: " + part2(input));
	}

	private function part1(input:String):Int {
		var uncompressedData:Int = 0;
		var c:Int = 0;

		while (c < input.length) {
			if (input.charAt(c) == "(") {
				var start:Int = c + 1;
				var end:Int = input.substr(start).indexOf(")");
				var instruct:Array<Int> = input.substr(start, end).split("x").map(Std.parseInt);
				uncompressedData += instruct[0] * instruct[1];

				c = start + end + instruct[0];
			} else {
				uncompressedData++;
			}

			c++;
		}

		return uncompressedData;
	}

	private function part2(input:String):Int64 {
		var uncompressedLength:Int64 = 0;
		var c:Int = 0;
		var r = ~/\(\d+x\d+\)/;

		while (c < input.length) {
			if (input.charAt(c) == "(") {
				var start:Int = c + 1;
				var end:Int = input.substr(start).indexOf(")");
				var instruct:Array<Int> = input.substr(start, end).split("x").map(Std.parseInt);
				var repeat:String = input.substr(start + end + 1, instruct[0]);

				if (r.match(repeat)) {
					uncompressedLength += instruct[1] * part2(repeat);
				} else {
					uncompressedLength += instruct[0] * instruct[1];
				}

				c = start + end + instruct[0];
			} else {
				uncompressedLength++;
			}

			c++;
		}

		return uncompressedLength;
	}
}
