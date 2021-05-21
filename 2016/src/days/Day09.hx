package days;

import haxe.io.Input;
import utils.ReadData;

using haxe.Int64;

class Day09 {
	public function new(path:String) {
		var input:String = ReadData.getFile(path);

		Sys.println("Part 1: " + part1(input).length);
		Sys.println("Part 2: " + testMulti(input));
	}

	private function part1(input:String):String {
		var uncompressedData:String = "";
		var c:Int = 0;

		while (c < input.length) {
			if (input.charAt(c) == "(") {
				var start:Int = c + 1;
				var end:Int = input.substr(start).indexOf(")");
				var instruct:Array<Int> = input.substr(start, end).split("x").map(Std.parseInt);
				var repeat:String = input.substr(start + end + 1, instruct[0]);

				for (i in 0...instruct[1]) {
					uncompressedData += repeat;
				}

				c = start + end + instruct[0];
			} else {
				uncompressedData += input.charAt(c);
			}

			c++;
		}

		return uncompressedData;
	}

	private function testMulti(data:String):Int64 {
		var uncompressedLength:Int64 = 0;
		var input:String = data;
		var c:Int = 0;
		var r = ~/\(\d+x\d+\)/;

		while (c < input.length) {
			if (input.charAt(c) == "(") {
				var start:Int = c + 1;
				var end:Int = input.substr(start).indexOf(")");
				var instruct:Array<Int> = input.substr(start, end).split("x").map(Std.parseInt);
				var repeat:String = input.substr(start + end + 1, instruct[0]);

				if (r.match(repeat)) {
					uncompressedLength += testMulti(repeat);
				}

				uncompressedLength += instruct[0] * instruct[1];

				c = start + end + instruct[0];
			} else {
				uncompressedLength++;
			}

			c++;
		}

		trace(uncompressedLength);
		return uncompressedLength;
	}
	/*
		private function part2(data:String):String {
			var r = ~/\(\d+x\d+\)/;
			var decomp:String = data;
			// var decomp:String = "(25x3)(3x3)ABC(2x3)XY(5x2)PQRSTX(18x9)(3x2)TWO(5x7)SEVEN";
			var c:Int = 0;
			while (r.match(decomp)) {
				decomp = part1(decomp);
				Sys.println(c);
				c++;
			}

			return decomp;
		}
	 */
}
