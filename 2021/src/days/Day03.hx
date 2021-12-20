package days;

using Math;
using StringTools;

import utils.ReadData;

/****
	Part 1 -
	Part 2 -
***/
class Day03 {
	public function new(path:String) {
		var lines:Array<String> = ReadData.getLines(path);

		Sys.print('Part 1: ');
		partOne(lines, true);
		Sys.println('Part 2: ' + partTwo(lines));
	}

	private function partOne(lines:Array<String>, printOutput:Bool = false):Array<Array<Int>> {
		var columnTotals:Array<Int> = [for (i in 0...lines[0].length) 0];
		var gammaBin:Array<Int> = columnTotals.copy();
		var epsilonBin:Array<Int> = columnTotals.copy();
		var gamma:Int = 0;
		var epsilon:Int = 0;

		for (line in lines) {
			var lineParts:Array<Int> = line.split("").map(Std.parseInt);
			for (c in 0...lineParts.length) {
				columnTotals[c] += lineParts[c];
			}
		}

		for (c in 0...columnTotals.length) {
			if (columnTotals[c] >= lines.length / 2) {
				gammaBin[c] = 1;
				epsilonBin[c] = 0;
			} else {
				gammaBin[c] = 0;
				epsilonBin[c] = 1;
			}
		}

		if (printOutput) {
			gamma = bin2Dec(gammaBin);
			epsilon = bin2Dec(epsilonBin);
			Sys.println(gamma * epsilon);
		}

		return [gammaBin, epsilonBin];
	}

	private function partTwo(lines:Array<String>):Int {
		var processed:Array<Array<Int>> = [[]];
		var oxygenList:Array<String> = lines.copy();
		var co2List:Array<String> = lines.copy();
		var loopCnt:Int = 0;
		var oxyValue:Int = 0;
		var co2Value:Int = 0;

		while (oxygenList.length > 1) {
			processed = partOne(oxygenList);
			var needle = processed[0].slice(0, loopCnt + 1).join("");
			oxygenList = oxygenList.filter(item -> item.startsWith(needle));

			loopCnt++;
		}

		oxyValue = bin2Dec(oxygenList[0].split("").map(Std.parseInt));

		loopCnt = 0;
		var needle = "";
		while (co2List.length > 1) {
			processed = partOne(co2List);
			needle = needle + processed[1][loopCnt];
			co2List = co2List.filter(item -> item.startsWith(needle));
			loopCnt++;
		}

		co2Value = bin2Dec(co2List[0].split("").map(Std.parseInt));

		return oxyValue * co2Value;
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
