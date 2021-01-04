package days;

using Math;
using StringTools;

import utils.ReadData;

/****
	Part 1 -
	For example, consider just the first seven characters of FBFBBFFRLR:

	Start by considering the whole range, rows 0 through 127.
	F means to take the lower half, keeping rows 0 through 63.
	B means to take the upper half, keeping rows 32 through 63.
	F means to take the lower half, keeping rows 32 through 47.
	B means to take the upper half, keeping rows 40 through 47.
	B keeps rows 44 through 47.
	F keeps rows 44 through 45.
	The final F keeps the lower of the two, row 44.

	The last three characters will be either L or R; these specify exactly one of the 8 columns
	of seats on the plane (numbered 0 through 7). The same process as above proceeds again, this
	time with only three steps. L means to keep the lower half, while R means to keep the upper half.

	For example, consider just the last 3 characters of FBFBBFFRLR:

	Start by considering the whole range, columns 0 through 7.
	R means to take the upper half, keeping columns 4 through 7.
	L means to take the lower half, keeping columns 4 through 5.
	The final R keeps the upper of the two, column 5.

	So, decoding FBFBBFFRLR reveals that it is the seat at row 44, column 5.

	Every seat also has a unique seat ID: multiply the row by 8, then add the column. In this example, the seat has ID 44 * 8 + 5 = 357.

	Part 2 -

***/
class Day05 {
	public function new(path:String) {
		var boarding:Array<String> = ReadData.getLines(path);

		Sys.println('Part 1: ' + partOne(boarding));
		Sys.println('Part 2: ' + partTwo(boarding));
	}

	private function partOne(boarding:Array<String>):Int {
		var highestSeatId:Int = 0;

		for (pass in boarding) {
			var seatId = 0;

			var row = getRow(pass);
			var column = getColumn(pass);

			seatId = row * 8 + column;
			if (seatId > highestSeatId) {
				highestSeatId = seatId;
			}
		}

		return highestSeatId;
	}

	private function partTwo(boarding:Array<String>):Int {
		var mySeatId:Int = 0;
		var allSeatIds:Array<Int> = [];

		for (pass in boarding) {
			var seatId = 0;

			var row = getRow(pass);
			var column = getColumn(pass);

			allSeatIds.push(row * 8 + column);
		}

		allSeatIds.sort((a, b) -> a - b);
		var count = allSeatIds[0];

		for (i in 0...allSeatIds.length) {
			if (allSeatIds[i] != count) {
				return count;
			}

			count++;
		}

		return mySeatId;
	}

	private function getRow(pass:String):Int {
		var rowLimit = [0, 127];
		var fb = pass.substr(0, 7);

		for (r in 0...fb.length) {
			var diff:Int = Math.round((rowLimit[1] - rowLimit[0]) / 2);

			if (fb.charAt(r) == "F") {
				// Lower
				rowLimit[1] = rowLimit[1] - diff;
			} else if (fb.charAt(r) == "B") {
				// Upper
				rowLimit[0] = rowLimit[0] + diff;
			}
		}
		return rowLimit[0];
	}

	private function getColumn(pass:String):Int {
		var columnLimit = [0, 7];
		var lr = pass.substr(7);

		for (c in 0...lr.length) {
			var diff:Int = Math.round((columnLimit[1] - columnLimit[0]) / 2);
			if (lr.charAt(c) == "L") {
				// Lower
				columnLimit[1] = columnLimit[1] - diff;
			} else if (lr.charAt(c) == "R") {
				// Upper
				columnLimit[0] = columnLimit[0] + diff;
			}
		}
		return columnLimit[0];
	}
}
