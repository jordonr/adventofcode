package days;

using Math;
using StringTools;

import utils.ReadData;

/****
	Part 1 -
	Part 2 -
***/
class Day03 {
	public function new(path:String) {
		var lines:Array<String> = ReadData.getLines(path);

		Sys.print('Part 1: ');
		partOne(lines, true);
		Sys.println('Part 2: ' + partTwo(lines));
	}

	private function partOne(lines:Array<String>, printOutput:Bool = false):Array<Array<Int>> {

		return [0, 0];
	}

	private function partTwo(lines:Array<String>):Int {
		var oxyValue:Int = 0;
		var co2Value:Int = 0;

		return oxyValue * co2Value;
	}
}
