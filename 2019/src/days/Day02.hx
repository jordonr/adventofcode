package days;

import haxe.iterators.StringIteratorUnicode;
import utils.ReadData;
import utils.IntCode;

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
	var intCodeComp:IntCode;

	public function new(path:String) {
		intCodeComp = new IntCode();
		var input:String = ReadData.getFile(path);
		var inputParts:Array<Int> = input.split(",").map(item -> Std.parseInt(item));

		Sys.println('Part 1: ' + partOne(inputParts.copy()));
		Sys.println('Part 2: ' + partTwo(inputParts.copy()));
	}

	private function partOne(input:Array<Int>):Int {
		input[1] = 12;
		input[2] = 2;
		var returnCodes = intCodeComp.runIntCode(input);
		return returnCodes[0];
	}

	private function partTwo(input:Array<Int>):String {
		return intCodeComp.searchInstructions(input, 19690720);
	}
}
