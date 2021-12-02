package days;

using Math;
using StringTools;

import utils.ReadData;

/****
	Part 1 -
	Count the number of times a depth measurement increases from the previous measurement.
	Part 2 -
	Your goal now is to count the number of times the sum of measurements in this sliding window increases from the previous sum. 
	So, compare A with B, then compare B with C, then C with D, and so on. Stop when there aren't enough measurements left to create a new three-measurement sum.
***/
class Day02 {
	public function new(path:String) {
		var lines:Array<String> = ReadData.getLines(path);

		Sys.println('Part 1: ' + partOne(lines));
		// Sys.println('Part 2: ' + partTwo(lines));
	}

	private function partOne(lines:Array<String>):Int {
		var x:Int = 0;
		var y:Int = 0;

		for (line in lines) {
			var lineParts:Array<String> = line.split(" ");
			var coords:Array<Int> = getCoords(lineParts);

			x = x + coords[0];
			y = y + coords[1];
		}

		return x * y;
	}

	private function partTwo(numbers:Array<Int>):Int {
		var deeper:Int = 0;

		return deeper;
	}

	private function getCoords(direction:Array<String>):Array<Int> {
		var x:Int = 0;
		var y:Int = 0;
		var move:Int = Std.parseInt(direction[1]);

		// up, down, forward
		switch (direction[0]) {
			case "down":
				y = y + move;
			case "up":
				y = y - move;
			case "forward":
				x = x + move;
			case "backward":
				x = x - move;
		}

		return [x, y];
	}
}
