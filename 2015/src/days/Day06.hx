package days;

import utils.ReadData;

class Day06 {
	var lightGrid:Array<Array<Int>> = [[]];
	var maxX:Int = 1000;
	var maxY:Int = 1000;
	var parseRegex = ~/([a-z\s]+)\s(\d{1,3},\d{1,3})\sthrough\s(\d{1,3},\d{1,3})/g;

	public function new(path:String) {
		var data:Array<String> = ReadData.getLines(path);
		Sys.println('Part 1: ' + partOne(data));
		Sys.println('Part 2: ' + partTwo(data));
	}

	private function partOne(data:Array<String>):Int {
		populateGrid();
		for (line in data) {
			parseRegex.match(line);
			var instruction:String = parseRegex.matched(1);
			var startPoint:Array<Int> = parseRegex.matched(2).split(",").map(Std.parseInt);
			var endPoint:Array<Int> = parseRegex.matched(3).split(",").map(Std.parseInt);

			for (x in startPoint[0]...endPoint[0] + 1) {
				for (y in startPoint[1]...endPoint[1] + 1) {
					if (instruction == "turn on") {
						lightGrid[x][y] = 1;
					} else if (instruction == "turn off") {
						lightGrid[x][y] = 0;
					} else if (instruction == "toggle") {
						lightGrid[x][y] = (lightGrid[x][y] == 1 ? 0 : 1);
					}
				}
			}
		}

		return countOnLights();
	}

	private function partTwo(data:Array<String>):Int {
		populateGrid();
		for (line in data) {
			parseRegex.match(line);
			var instruction:String = parseRegex.matched(1);
			var startPoint:Array<Int> = parseRegex.matched(2).split(",").map(Std.parseInt);
			var endPoint:Array<Int> = parseRegex.matched(3).split(",").map(Std.parseInt);

			for (x in startPoint[0]...endPoint[0] + 1) {
				for (y in startPoint[1]...endPoint[1] + 1) {
					if (instruction == "turn on") {
						lightGrid[x][y] += 1;
					} else if (instruction == "turn off") {
						lightGrid[x][y] += -1;
						if (lightGrid[x][y] < 0) {
							lightGrid[x][y] = 0;
						}
					} else if (instruction == "toggle") {
						lightGrid[x][y] += 2;
					}
				}
			}
		}

		return countOnLights();
	}

	private function populateGrid() {
		for (x in 0...maxX) {
			lightGrid[x] = new Array<Int>();
			for (y in 0...maxY) {
				lightGrid[x][y] = 0;
			}
		}
	}

	private function countOnLights():Int {
		var lit:Int = 0;

		for (x in 0...lightGrid.length) {
			for (y in 0...lightGrid[x].length) {
				lit += lightGrid[x][y];
			}
		}

		return lit;
	}
}
