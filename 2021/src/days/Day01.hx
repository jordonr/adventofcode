package days;

using Math;
using StringTools;

import utils.ReadData;

/****
	Part 1 -
	Count the number of times a depth measurement increases from the previous measurement.
	Part 2 -

***/
class Day01 {
	public function new(path:String) {
		var lines:Array<String> = ReadData.getLines(path);

		var numbers = lines.map(function(v) {
			return Std.parseInt(v);
		});

		Sys.println('Part 1: ' + partOne(numbers));
		Sys.println('Part 2: ' + partTwo(numbers));
	}

	private function partOne(numbers:Array<Int>):Int {
		var deeper:Int = 0;
		var prevDepth:Int = numbers[0];

		for (i in 0...numbers.length) {
			if (prevDepth < numbers[i]) {
				deeper++;
			}

			prevDepth = numbers[i];
		}

		return deeper;
	}

	private function partTwo(numbers:Array<Int>):Int {
		var deeper:Int = 0;
		var prevDepth:Int = numbers[0] + numbers[1] + numbers[2];

		for (i in 0...numbers.length - 2) {
			var currentDepth:Int = numbers[i] + numbers[i + 1] + numbers[i + 2];

			if (prevDepth < currentDepth) {
				deeper++;
			}

			prevDepth = currentDepth;
		}

		return deeper;
	}
}
