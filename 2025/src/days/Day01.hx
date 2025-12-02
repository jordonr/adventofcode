package days;

import utils.ReadData;

class Day01 {
	private var start:Int = 50;
	private var max:Int = 100;

	public function new(path:String) {
		var lines:Array<String> = ReadData.getLinesTrimmed(path);

		Sys.println('Part 1: ' + partOne(lines));
		// Sys.println('Part 2: ' + partTwo(numbers));
	}

	private function partOne(lines:Array<String>):Int {
		var current:Int = start;
		var count:Int = 0;
		
		for(l in lines) {
			var dir = l.substring(0, 1);
			var clicks = Std.parseInt(l.substring(1, l.length));

			if(dir == "R") {
				current += clicks;
			} else if(dir == "L") {
				current -= clicks;	
			}

			if(current%100 == 0) {
				count++;
			}
		}

		return count;
	}

	private function partTwo(numbers:Array<Int>):Int {
		var countCals:Int = 0;
		
		return countCals;
	}
}
