package days;

import utils.ReadData;

class Day01 {
	public function new(path:String) {
		var data:String = ReadData.getFile(path);
		Sys.println('Part 1: ' + partOne(data));
		Sys.println('Part 2: ' + partTwo(data));
	}

	private function partOne(data:String):Int {
		var floor:Int = 0;

		for (c in 0...data.length) {
			if (data.charAt(c) == "(") {
				floor++;
			} else if (data.charAt(c) == ")") {
				floor--;
			}
		}

		return floor;
	}

	private function partTwo(data:String):Int {
		var floor:Int = 0;

		for (c in 0...data.length) {
			if (data.charAt(c) == "(") {
				floor++;
			} else if (data.charAt(c) == ")") {
				floor--;
			}

			if (floor == -1) {
				return c + 1;
			}
		}

		return 0;
	}
}
