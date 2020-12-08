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
		var bagList:Array<String> = input.split("\n");

		Sys.println('Part 1: ' + partOne(bagList));
		Sys.println('Part 2: ' + partTwo(bagList));
	}

	private static function partOne(bagList:Array<String>):Int {
		var bags:Array<String> = [];
		var uniqueBags:Array<String> = [];
		var shinySearch = " shiny gold";

		var bags = bagBags(shinySearch, bagList);
		for (bag in bags) {
			if (uniqueBags.indexOf(bag) == -1) {
				uniqueBags.push(bag);
			}
		}

		return uniqueBags.length;
	}

	private static function partTwo(bagList:Array<String>):Int {
		var bags:Int = bagCounter("shiny gold", bagList);

		return bags - 1; // Don't count the shiny gold bag
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

	private static function bagCounter(bagColor:String, bagList:Array<String>):Int {
		var bags:Int = 1;
		var containedRegex = ~/(\d+)\s(\w+\s\w+)\sbags?/g;

		for (bag in bagList) {
			if (bag.indexOf(bagColor) == 0) {
				var bagDef = bag;
				while (containedRegex.match(bagDef)) {
					bags += Std.parseInt(containedRegex.matched(1)) * bagCounter(containedRegex.matched(2), bagList);
					bagDef = containedRegex.matchedRight();
				}
			}
		}

		return bags;
	}
}
