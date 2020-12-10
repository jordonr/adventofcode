package days;

import utils.ReadData;

class Day02 {
	public function new(path:String) {
		var data:Array<String> = ReadData.getLines(path);
		Sys.println('Part 1: ' + partOne(data));
		Sys.println('Part 2: ' + partTwo(data));
	}

	private function partOne(data:Array<String>):Int {
		// 2x3x4
		// 2*l*w + 2*w*h + 2*h*l

		var area:Int = 0;

		for (d in data) {
			var lwh:Array<Int> = d.split("x").map(item -> Std.parseInt(item));
			area += 2 * (lwh[0] * lwh[1] + lwh[1] * lwh[2] + lwh[0] * lwh[2]);
			lwh.sort((a, b) -> a - b);
			area += lwh[0] * lwh[1];
		}

		return area;
	}

	private function partTwo(data:Array<String>):Int {
		// 2x3x4
		// 2+2+3+3 = 10
		// 2*3*4 = 24
		var length:Int = 0;

		for (d in data) {
			var lwh:Array<Int> = d.split("x").map(item -> Std.parseInt(item));
			lwh.sort((a, b) -> a - b);
			length += (lwh[0] * 2 + lwh[1] * 2) + (lwh[0] * lwh[1] * lwh[2]);
		}

		return length;
	}
}
