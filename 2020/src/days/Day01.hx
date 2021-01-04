package days;

using Math;
using StringTools;

import utils.ReadData;

/****
	Part 1 -
	In this list, the two entries that sum to 2020 are 1721 and 299. Multiplying them together produces 1721 * 299 = 514579, 
	so the correct answer is 514579.
	Part 2 -
	Using the above example again, the three entries that sum to 2020 are 979, 366, and 675. Multiplying them together 
	produces the answer, 241861950.
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
		for (i in 0...numbers.length) {
			for (j in 0...numbers.length) {
				if (numbers[i] + numbers[j] == 2020) {
					return numbers[i] * numbers[j];
				}
			}
		}

		return 0;
	}

	private function partTwo(numbers:Array<Int>):Int {
		for (i in 0...numbers.length) {
			for (j in 0...numbers.length) {
				if (numbers[i] + numbers[j] < 2020) {
					for (l in 0...numbers.length) {
						if (numbers[i] + numbers[j] + numbers[l] == 2020) {
							return numbers[i] * numbers[j] * numbers[l];
						}
					}
				}
			}
		}

		return 0;
	}
}
