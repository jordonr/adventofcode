package days;

import utils.ReadData;

class Day01 {
	public function new(path:String) {
		var lines:Array<String> = ReadData.getLines(path);

		var numbers = lines.map(function(v) {
			return Std.parseInt(v);
		});

		Sys.println('Part 1: ' + partOne(numbers));
		Sys.println('Part 2: ' + partTwo(numbers));
	}

	private function partOne(numbers:Array<Int>):Int {
		var mostCals:Int = 0;
		var countCals:Int = 0;
		
		for(l in numbers) {
			if(l == null) {
				if(countCals > mostCals) {
					mostCals = countCals;
				}
				
				countCals = 0;
			} else {
				countCals += l;
			}
		}

		return mostCals;
	}

	private function partTwo(numbers:Array<Int>):Int {
		var countCals:Int = 0;
		var elfsCals:Array<Int> = [];
		
		for(l in numbers) {
			if(l == null) {
				elfsCals.push(countCals);
				countCals = 0;
			} else {
				countCals += l;
			}
		}
		
		elfsCals.sort((a, b) -> b - a);

		return elfsCals[0] + elfsCals[1] + elfsCals[2];
	}
}
