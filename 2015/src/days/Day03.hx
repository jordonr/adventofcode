package days;

import utils.ReadData;

class Day03 {
	public function new(path:String) {
		var data:String = ReadData.getFile(path);
		Sys.println('Part 1: ' + partOne(data));
		Sys.println('Part 2: ' + partTwo(data));
	}

	private function partOne(data:String):Int {
		var grid:Map<String, Int> = new Map<String, Int>();
		var x:Int = 0;
		var y:Int = 0;

		for (c in 0...data.length) {
			var coord:Array<Int> = getCoords(data.charAt(c));
			x += coord[0];
			y += coord[1];
			var indx = x + "," + y;
			grid[indx] = (grid[indx] != null ? grid[indx]++ : grid[indx] = 1);
		}

		return Lambda.count(grid);
	}

	private function partTwo(data:String):Int {
		var grid:Map<String, Int> = new Map<String, Int>();
		var santa:Array<Int> = [0, 0];
		var robo:Array<Int> = [0, 0];

		for (c in 0...data.length) {
			var x = 0;
			var y = 0;
			var coord:Array<Int> = getCoords(data.charAt(c));
			var santaMod:Int = c % 2;

			if (santaMod == 0) {
				x = santa[0];
				y = santa[1];
			} else {
				x = robo[0];
				y = robo[1];
			}

			x += coord[0];
			y += coord[1];
			var indx = x + "," + y;
			grid[indx] = (grid[indx] != null ? grid[indx]++ : grid[indx] = 1);

			if (santaMod == 0) {
				santa[0] = x;
				santa[1] = y;
			} else {
				robo[0] = x;
				robo[1] = y;
			}
		}

		return Lambda.count(grid);
	}

	private function getCoords(direction:String):Array<Int> {
		var x:Int = 0;
		var y:Int = 0;

		// v><^
		switch (direction) {
			case "^":
				y++;
			case "v":
				y--;
			case ">":
				x++;
			case "<":
				x--;
		}
		return [x, y];
	}
}
