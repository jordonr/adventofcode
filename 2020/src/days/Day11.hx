package days;

import haxe.display.Display.Package;
import utils.ReadData;

using Lambda;

class Day11 {
	var seatGrid:Array<Array<String>>;
	var newGrid:Array<Array<String>>;
	var offset:Int;

	public function new(path:String) {
		var data:Array<String> = ReadData.getLines(path);
		seatGrid = new Array<Array<String>>();
		newGrid = new Array<Array<String>>();
		offset = 4;

		populateGrid(data);
		Sys.println('Part 1: ' + partOne(1));
		// Sys.println('Part 2: ' + partOne(2));
	}

	private function partOne(part:Int):Int {
		var shuffle = true;
		while (shuffle) {
			newGrid = [[]];
			for (r in 0...seatGrid.length) {
				for (c in 0...seatGrid[r].length) {
					if (newGrid[r] == null) {
						newGrid.insert(r, []);
					}

					if (part == 1) {
						newGrid[r].insert(c, p1SeatChecker(r, c));
					} else {
						newGrid[r].insert(c, p2SeatChecker(r, c));
					}
				}
			}

			if (newGrid.toString() == seatGrid.toString()) {
				shuffle = false;
			}

			seatGrid = newGrid.copy();
		}

		return seatGrid.toString().split("#").length - 1;
	}

	private function partTwo():Int {
		return 0;
	}

	private function populateGrid(data:Array<String>):Void {
		for (r in data) {
			var row:Array<String> = [];
			for (c in 0...r.length) {
				row.push(r.charAt(c));
			}

			seatGrid.push(row);
		}
	}

	private function p1SeatChecker(r:Int, c:Int):String {
		var seats:Array<String> = [];

		if (seatGrid[r][c] == ".") {
			return ".";
		}

		seats.push((r + 1 >= seatGrid.length ? "." : seatGrid[r + 1][c]));
		seats.push((r - 1 < 0 ? "." : seatGrid[r - 1][c]));
		seats.push((c + 1 >= seatGrid[r].length ? "." : seatGrid[r][c + 1]));
		seats.push((c - 1 < 0 ? "." : seatGrid[r][c - 1]));

		seats.push((r + 1 >= seatGrid.length || c - 1 < 0 ? "." : seatGrid[r + 1][c - 1]));
		seats.push((r + 1 >= seatGrid.length || c + 1 >= seatGrid[r].length ? "." : seatGrid[r + 1][c + 1]));
		seats.push((r - 1 < 0 || c + 1 >= seatGrid[r].length ? "." : seatGrid[r - 1][c + 1]));
		seats.push((r - 1 < 0 || c - 1 < 0 ? "." : seatGrid[r - 1][c - 1]));

		if (seatGrid[r][c] == "L" && seats.filter(item -> item == "L" || item == ".").length == 8) {
			return "#";
		} else if (seatGrid[r][c] == "#" && seats.filter(item -> item == "#").length >= 4) {
			return "L";
		}
		return seatGrid[r][c];
	}

	private function p2SeatChecker(r:Int, c:Int):String {
		var seats:Array<String> = [];

		if (seatGrid[r][c] == ".") {
			return ".";
		}

		return seatGrid[r][c];
	}

	private function printGrid(grid:Array<Array<String>>):Void {
		for (r in grid) {
			for (c in r) {
				Sys.print(c);
			}
			Sys.print("\n");
		}
	}
}
