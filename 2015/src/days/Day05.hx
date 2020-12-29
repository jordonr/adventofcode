package days;

import utils.ReadData;

class Day05 {
	public function new(path:String) {
		var data:Array<String> = ReadData.getLines(path);
		Sys.println('Part 1: ' + partOne(data));
		Sys.println('Part 2: ' + partTwo(data));
	}

	private function partOne(data:Array<String>):Int {
		var nice:Int = 0;

		for (line in data) {
			if (checkBadPairs(line)) {
				continue;
			}

			if (checkVowels(line) && checkDoubles(line)) {
				nice++;
			}
		}

		return nice;
	}

	private function partTwo(data:Array<String>):Int {
		var nice:Int = 0;

		for (line in data) {
			if (checkDoublePairs(line) && checkBetween(line)) {
				nice++;
			}
		}

		return nice;
	}

	private function checkBadPairs(line:String):Bool {
		var badPairsRegex = ~/(ab|cd|pq|xy)/g;
		return badPairsRegex.match(line);
	}

	private function checkVowels(line:String):Bool {
		var vowelsRegex = ~/[aeiou]/g;
		var parts:Array<String> = vowelsRegex.split(line);

		if (parts.length > 3) {
			return true;
		}

		return false;
	}

	private function checkDoubles(line:String):Bool {
		var doubleRegex = ~/(.)\1{1}/g;

		return doubleRegex.match(line);
	}

	private function checkDoublePairs(line:String):Bool {
		var pairRegex = ~/(.{2}).*(\1)/g;
		var parts:Array<String> = pairRegex.split(line);

		if (parts.length > 1) {
			return true;
		}

		return false;
	}

	private function checkBetween(line:String):Bool {
		var betweenRegex = ~/(.).\1{1}/g;

		return betweenRegex.match(line);
	}
}
