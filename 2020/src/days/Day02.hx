package days;

using Math;
using StringTools;

import utils.ReadData;

/****
	Part 1 -
	Each line gives the password policy and then the password. The password policy indicates the lowest and highest number of times a
	given letter must appear for the password to be valid. For example, 1-3 a means that the password must contain a at least 1 time and at most 3 times.

	Part 2 -
	Each policy actually describes two positions in the password, where 1 means the first character, 2 means the second character, and so on. (Be careful;
	Toboggan Corporate Policies have no concept of "index zero"!) Exactly one of these positions must contain the given letter.
***/
class Day02 {
	public function new(path:String) {
        var lines:Array<String> = ReadData.getLines(path);

		Sys.println('Part 1: ' + partOne(lines));
		Sys.println('Part 2: ' + partTwo(lines));
	}

	private function partOne(lines:Array<String>):Int {
		var pwRegex = ~/(\d+)-(\d+)\s(\w):\s(\w+)/g;
		var valid = 0;

		for (i in 0...lines.length) {
			pwRegex.match(lines[i]);
			var charCount = 0;
			var password = pwRegex.matched(4);
			var testChar = pwRegex.matched(3);
			var max = Std.parseInt(pwRegex.matched(2));
			var min = Std.parseInt(pwRegex.matched(1));

			for (c in 0...password.length) {
				if (password.charAt(c) == testChar) {
					charCount++;
				}
			}

			if (charCount >= min && charCount <= max) {
				valid++;
			}
		}

		return valid;
	}

	private function partTwo(lines:Array<String>):Int {
		var pwRegex = ~/(\d+)-(\d+)\s(\w):\s(\w+)/g;
		var valid = 0;

		for (i in 0...lines.length) {
			pwRegex.match(lines[i]);
			var password = pwRegex.matched(4);
			var testChar = pwRegex.matched(3);
			var matchOne = Std.parseInt(pwRegex.matched(2)) - 1;
			var matchTwo = Std.parseInt(pwRegex.matched(1)) - 1;

			if ((password.charAt(matchOne) == testChar && password.charAt(matchTwo) != testChar)
				|| password.charAt(matchTwo) == testChar
				&& password.charAt(matchOne) != testChar) {
				valid++;
			}
		}

		return valid;
	}
}
