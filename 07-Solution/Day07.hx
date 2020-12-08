package;

using Math;
using StringTools;

/****
	Part 1 -

	Part 2 -

***/
class Day07 {
	private static inline var inputPath:String = "../inputs/Day07.txt";
	// private static inline var inputPath:String = "../inputs/Day07-Test.txt";
	private static var input:String = "";

	static public function main() {
		input = sys.io.File.getContent(inputPath).trim();

		Sys.println('Part 1: ' + partOne(input));
		// Sys.println('Part 2: ' + partTwo(customs));
	}

	private static function partOne(input:String):Int {
		var bags:Int = 0;
		var bagList = input.split("\n");
		var shinyRegex = ~/ shiny gold/g;
		var containters = [];

		for (bagDef in bagList) {
			if (shinyRegex.match(bagDef)) {
				containters.push(bagDef);
			}
		}

		trace(containters);

		return bags;
	}

	private static function partTwo(customs:Array<String>):Int {
		var yesTotal:Int = 0;

		return yesTotal;
	}
}
