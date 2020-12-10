package;

using Math;
using StringTools;

/****
	Part 1 -
	In this list, the two entries that sum to 2020 are 1721 and 299. Multiplying them together produces 1721 * 299 = 514579, so the correct answer is 514579.
	Part 2 -
	Using the above example again, the three entries that sum to 2020 are 979, 366, and 675. Multiplying them together produces the answer, 241861950.
***/
class Day01 {
	private static inline var inputPath:String = "../inputs/Day01.txt";
	// private static inline var inputPath: String = "../inputs/Day01-Test.txt";
	private static var input:String = "";

	static public function main() {
		input = sys.io.File.getContent(inputPath).trim();
		var lineRegex = ~/\n/g;
		var lines:Array<String> = lineRegex.split(input);

		var numbers = lines.map(function(v) {
			return Std.parseInt(v);
		});

		Sys.println('Part 1: ' + partOne(numbers));
		Sys.println('Part 2: ' + partTwo(numbers));
	}

	private static function partOne(numbers:Array<Int>):Int {
		for (i in 0...numbers.length) {
			for (j in 0...numbers.length) {
				if (numbers[i] + numbers[j] == 2020) {
					return numbers[i] * numbers[j];
				}
			}
		}

		return 0;
	}

	private static function partTwo(numbers:Array<Int>):Int {
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
