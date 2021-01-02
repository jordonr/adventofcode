package days;

using Math;
using StringTools;

import utils.ReadData;

/****
	Part 1 -

	Part 2 -
	Used Part 1 to find the line that stared the loop, changed it from jmp to nop
***/
class Day09 {
	public function new(path:String) {
		var preamble:Array<String> = ReadData.getLines(path);

		var badNumber:Int = partOne(preamble, 25);

		Sys.println('Part 1: ' + badNumber);
		Sys.println('Part 2: ' + partTwo(preamble, badNumber));
	}

	private function partOne(preamble:Array<String>, prev:Int):Int {
		var answer:Int = 0;
		var history:Array<Int> = [];

		for (i in 0...prev) {
			history.push(Std.parseInt(preamble[i]));
		}

		for (i in prev...preamble.length) {
			var test:Int = Std.parseInt(preamble[i]);
			if (!checkSum(history, test)) {
				return test;
			}

			history.shift();
			history.push(test);
		}

		return answer;
	}

	private function partTwo(preamble:Array<String>, badNumber:Int):Int {
		var history:Array<Int> = [];
		var total:Int = 0;

		for (line in preamble) {
			var num:Int = Std.parseInt(line);

			history.push(num);
			total += num;

			while (total > badNumber) {
				total = total - history.shift();
			}

			if (total == badNumber && history.length > 1) {
				history.sort((a, b) -> a - b);
				return history.shift() + history.pop();
			}
		}

		return 0;
	}

	private function checkSum(numberList:Array<Int>, sum:Int):Bool {
		for (i in 0...numberList.length) {
			for (j in 0...numberList.length) {
				if (numberList[i] + numberList[j] == sum && i != j) {
					return true;
				}
			}
		}

		return false;
	}
}
