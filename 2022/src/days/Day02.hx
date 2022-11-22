package days;

using Math;
using StringTools;

import utils.ReadData;

class Day02 {
	public function new(path:String) {
		var lines:Array<String> = ReadData.getLines(path);

		Sys.println('Part 1: ' + partOne(lines));
		Sys.println('Part 2: ' + partTwo(lines));
	}

	private function partOne(lines:Array<String>):Int {
		var x:Int = 0;
		var y:Int = 0;

		return x * y;
	}

	private function partTwo(lines:Array<String>):Int {
		var x:Int = 0;
		var y:Int = 0;


		return x * y;
	}
}
