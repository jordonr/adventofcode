package;

using Math;
using StringTools;

/****
	Part 1 -

	Part 2 -

***/
class Day06 {
	private static inline var inputPath:String = "../inputs/Day06.txt";
	// private static inline var inputPath:String = "../inputs/Day06-Test.txt";
	private static var input:String = "";

	static public function main() {
		input = sys.io.File.getContent(inputPath).trim();
		var lineRegex = ~/\n\n/g;
		var customs:Array<String> = lineRegex.split(input);

		Sys.println('Part 1: ' + partOne(customs));
		Sys.println('Part 2: ' + partTwo(customs));
	}

	private static function partOne(customs:Array<String>):Int {
		var yesTotal:Int = 0;

		for (qa in customs) {
			var uniqueAnswers = [];
			var answers = qa.replace("\n", "").split("").map(item -> {
				var v = item.trim();
				if (uniqueAnswers.indexOf(v) == -1) {
					uniqueAnswers.push(v);
				}

				return v;
			});

			yesTotal += uniqueAnswers.length;
		}

		return yesTotal;
	}

	private static function partTwo(customs:Array<String>):Int {
		var yesTotal:Int = 0;

		for (qa in customs) {
			var group = qa.split("\n");
			var common = new Map<String, Int>();

			for (person in group) {
				for (a in person.split("")) {
					common[a] = (common[a] == null ? 1 : common[a] + 1);
				}
			}

			for (c in common) {
				if (c == group.length) {
					yesTotal++;
				}
			}
		}

		return yesTotal;
	}
}
