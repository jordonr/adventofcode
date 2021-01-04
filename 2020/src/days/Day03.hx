package days;

using Math;
using StringTools;
using haxe.Int64;

import utils.ReadData;

/****
	Part 1 -
	From your starting position at the top-left, check the position that is right 3 and down 1.
	Then, check the position that is right 3 and down 1 from there, and so on until you go past the bottom of the map.

	Part 2 -
	These slopes would find 2, 7, 3, 4, and 2 tree(s) respectively; multiplied together, these produce the answer 336.
***/
class Day03 {
	public function new(path:String) {
		var lines:Array<String> = ReadData.getLines(path);

		Sys.println('Part 1: ' + downHill(lines, 3, 1));
		var product = downHill(lines, 1, 1) * downHill(lines, 3, 1) * downHill(lines, 5, 1) * downHill(lines, 7, 1) * downHill(lines, 1, 2);
		Sys.println('Part 2: ' + product);
	}

	private function downHill(lines:Array<String>, right:Int, down:Int):Int64 {
		var trees = 0;
		var treeChar = "#";
		var dist = 0;
		var count = 0;

		while (dist < lines.length) {
			var pos = ((count * right) % lines[dist].length);

			if (lines[dist].charAt(pos) == "#") {
				trees++;
			}

			dist = dist + down;
			count++;
		}

		return trees;
	}
}
