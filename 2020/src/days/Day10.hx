package days;

import utils.ReadData;

using haxe.Int64;

class Day10 {
	var adapters:Array<Int>;

	public function new(path:String) {
		var data:Array<String> = ReadData.getLines(path);
		Sys.println('Part 1: ' + partOne(data));
		Sys.println('Part 2: ' + partTwo(data));
	}

	private function partOne(data:Array<String>):Int {
		var big:Int = 1;
		var small:Int = 0;

		adapters = data.map((item) -> Std.parseInt(item));
		adapters.sort((a, b) -> a - b);

		if (adapters[0] == 1 && adapters[0] == 3) {
			small++;
		}

		for (i in 1...adapters.length) {
			if (adapters[i] == adapters[i - 1] + 1) {
				small++;
			}

			if (adapters[i] == adapters[i - 1] + 3) {
				big++;
			}
		}

		return big * small;
	}

	private function partTwo(data:Array<String>):Int64 {
		adapters = data.map((item) -> Std.parseInt(item));
		adapters.sort((a, b) -> a - b);
		adapters.unshift(0);
		adapters.push(adapters[adapters.length - 1] + 3);

		var comboList:Array<Int64> = [1];

		for (i in 1...adapters.length) {
			var cp:Int64 = combosPossible(i);

			if (cp == 1) {
				comboList[i] = comboList[i - 1];
			} else if (cp == 2) {
				comboList[i] = comboList[i - 1] + comboList[i - 2];
			} else if (cp == 3) {
				comboList[i] = comboList[i - 1] + comboList[i - 2] + comboList[i - 3];
			}
		}

		return comboList[comboList.length - 1];
	}

	private function combosPossible(num:Int):Int {
		var combos:Int = 0;

		if (num - 1 >= 0 && adapters[num] - adapters[num - 1] <= 3) {
			combos++;
		}

		if (num - 2 >= 0 && adapters[num] - adapters[num - 2] <= 3) {
			combos++;
		}

		if (num - 3 >= 0 && adapters[num] - adapters[num - 3] <= 3) {
			combos++;
		}

		return combos;
	}
}
