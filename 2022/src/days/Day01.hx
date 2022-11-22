package days;

using StringTools;

import utils.ReadData;

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

		return deeper;
	}

	private function partTwo(numbers:Array<Int>):Int {
		var deeper:Int = 0;

		return deeper;
	}
}
