package days;

import haxe.exceptions.PosException;

using StringTools;

import haxe.Json;
import utils.ReadData;

typedef Point = {x:Int, y:Int};

/****
	Part 1 -
	Part 2 -
***/
class Day05 {
	public function new(path:String) {
		var lines:Array<String> = ReadData.getLines(path);

		Sys.println('Part 1: ' + partOne(lines));
		Sys.println('Part 2: ' + partTwo(lines));
	}

	private function partOne(lines:Array<String>):Int {
		return 0;
	}

	private function partTwo(numbers:Array<String>):Int {
		var deeper:Int = 0;

		return deeper;
	}
}
