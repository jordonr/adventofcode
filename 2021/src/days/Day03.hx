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
class Day03 {
	public function new(path:String) {
		var lines:Array<String> = ReadData.getLines(path);

		Sys.println('Part 1: ' + partOne(lines));
		// Sys.println('Part 2: ' + partTwo(numbers));
	}

	private function partOne(lines:Array<String>):Int {
		var totalLines = lines.length;
		var columnTotals:Array<Int> = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
		var gammaBin:Array<Int> = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
		var epsilonBin:Array<Int> = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
		var gamma:Int = 0;
		var epsilon:Int = 0;

		for (line in lines) {
			var lineParts:Array<Int> = line.split("").map(Std.parseInt);
			for (c in 0...lineParts.length) {
				columnTotals[c] += lineParts[c];
			}
		}

		for (c in 0...columnTotals.length) {
			if (columnTotals[c] > 500) {
				gammaBin[c] = 1;
				epsilonBin[c] = 0;
			} else {
				gammaBin[c] = 0;
				epsilonBin[c] = 1;
			}
		}

		gamma = bin2Dec(gammaBin);
		epsilon = bin2Dec(epsilonBin);

		return gamma * epsilon;
	}

	private function bin2Dec(bin:Array<Int>):Int {
		var powers:Int = bin.length - 1;
		var dec:Int = 0;

		for (i in 0...bin.length) {
			dec += Std.int(bin[i] * Math.pow(2, powers));
			powers--;
		}

		return dec;
	}
}
