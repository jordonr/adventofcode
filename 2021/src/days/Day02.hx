package days;

using Math;
using StringTools;

import utils.ReadData;

/****
	Part 1 -
	forward X increases the horizontal position by X units.
	down X increases the depth by X units.
	up X decreases the depth by X units.

	Part 2 -
	down X increases your aim by X units.
	up X decreases your aim by X units.
	forward X does two things:
		It increases your horizontal position by X units.
		It increases your depth by your aim multiplied by X.
***/
class Day02 {
	public function new(path:String) {
		var lines:Array<String> = ReadData.getLines(path);

		Sys.println('Part 1: ' + partOne(lines));
		Sys.println('Part 2: ' + partTwo(lines));
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

	private function partTwo(lines:Array<String>):Int {
		var x:Int = 0;
		var y:Int = 0;
		var aim:Int = 0;

		for (line in lines) {
			var lineParts:Array<String> = line.split(" ");
			var coords:Array<Int> = getAdvCoords(lineParts, aim);

			x = x + coords[0];
			y = y + coords[1];
			aim = coords[2];
		}

		return x * y;
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

	private function getAdvCoords(direction:Array<String>, currentAim:Int):Array<Int> {
		var x:Int = 0;
		var y:Int = 0;
		var aim:Int = currentAim;
		var move:Int = Std.parseInt(direction[1]);

		// up, down, forward
		switch (direction[0]) {
			case "down":
				aim = aim + move;
			case "up":
				aim = aim - move;
			case "forward":
				x = x + move;
				y += aim * move;
			case "backward":
				x = x - move;
		}

		return [x, y, aim];
	}
}
