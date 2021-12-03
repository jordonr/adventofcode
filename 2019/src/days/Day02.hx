package days;

using Math;
using StringTools;

import utils.ReadData;

/****
	Part 1 -
	# 1  = add
	# 2  = multiply
	# 99 = halt
	# Chunks of 4
	# For example:
	# 1,0,0,0,99 becomes 2,0,0,0,99 (1 + 1 = 2).
	# 2,3,0,3,99 becomes 2,3,0,6,99 (3 * 2 = 6).
	# 2,4,4,5,99,0 becomes 2,4,4,5,99,9801 (99 * 99 = 9801).
	# 1,1,1,4,99,5,6,0,99 becomes 30,1,1,4,2,5,6,0,99.

	Part 2 -
***/
class Day02 {
	public function new(path:String) {
		var lines:Array<String> = ReadData.getLines(path);
		var test:Array<String> = ["1,9,10,3,2,3,11,0,99,30,40,50"];

		Sys.println('Part 1: ' + partOne(test));
		Sys.println('Part 2: ' + partTwo(lines));
	}

	private function partOne(lines:Array<String>):Int {
		for (line in lines) {
			var lineParts:Array<String> = line.split(",");
			trace(lineParts);
		}

		return 0;
	}

	private function partTwo(lines:Array<String>):Int {
		return 0;
	}
}
