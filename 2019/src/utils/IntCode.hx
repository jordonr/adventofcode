package utils;

class IntCode {
	public function new(?code:Array<Int>) {}

	// public function setIntCode(code:Array<Int>):Void {
	// 	_intCode = code;
	// }

	public function runIntCode(code):Array<Int> {
		var currentCode = 0;
		var location = 0;
		var intCode = code;

		while (currentCode != 99) {
			currentCode = intCode[location];

			if (currentCode == 1) {
				intCode[intCode[location + 3]] = intCode[intCode[location + 1]] + intCode[intCode[location + 2]];
			} else if (currentCode == 2) {
				intCode[intCode[location + 3]] = intCode[intCode[location + 1]] * intCode[intCode[location + 2]];
			}

			location = location + 4;
		}

		return intCode;
	}

	public function searchInstructions(code:Array<Int>, needle:Int):String {
		var intCode = code;

		for (i in 0...99) {
			intCode[1] = i;
			for (j in 0...99) {
				intCode[2] = j;

				var output = runIntCode(intCode.copy());

				if (output[0] == needle) {
					return "Found it: 100*" + i + "+" + j + " = " + (100 * i + j);
				}
			}
		}

		return "Not Found!";
	}
}
