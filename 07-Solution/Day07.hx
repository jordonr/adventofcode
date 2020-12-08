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
		var bags:Array<String> = [];
		var uniqueBags:Array<String> = [];
		var bagList:Array<String> = input.split("\n");
		var shinySearch = " shiny gold";

		var bags = bagBags(shinySearch, bagList);
		for (bag in bags) {
			if (uniqueBags.indexOf(bag) == -1) {
				uniqueBags.push(bag);
			}
		}

		return uniqueBags.length;
	}

	private static function partTwo(customs:Array<String>):Int {
		var yesTotal:Int = 0;

		return yesTotal;
	}

	private static function bagBags(bagSearch:String, bagList:Array<String>):Array<String> {
		var hasShiny:Array<String> = [];
		var bagRegex = ~/^(\w+ \w+) bags/g;

		for (bag in bagList) {
			if (bag.indexOf(bagSearch) > -1 && bagRegex.match(bag)) {
				hasShiny.push(bag);
				hasShiny = hasShiny.concat(bagBags(" " + bagRegex.matched(1), bagList));
			}
		}

		return hasShiny;
	}
}
