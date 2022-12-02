package days;

using Math;
using StringTools;

import utils.ReadData;

class Day02 {

	// Rock, Paper, Scissors
	private var rpsValues:Map<String, Int> = [ "A" => 1, "B" => 2, "C" => 3, "X" => 1, "Y" => 2, "Z" => 3];
	
	public function new(path:String) {
		var lines:Array<String> = ReadData.getLines(path);

		Sys.println('Part 1: ' + partOne(lines));
		Sys.println('Part 2: ' + partTwo(lines));
	}

	private function partOne(lines:Array<String>):Int {
		var total:Int = 0;

		for(game in lines) {
			var them = game.charAt(0);
			var me = game.charAt(2);
			
			total += rpsValues[me];
			
			// Tie
			if(rpsValues[me] == rpsValues[them]) {
				total += 3;	
			} else if((rpsValues[me] == 1 && rpsValues[them] == 3) ||
				(rpsValues[me] == 2 && rpsValues[them] == 1) ||
				(rpsValues[me] == 3 && rpsValues[them] == 2)
			) { 
				total += 6;
			}
		}

		return total;
	}

	private function partTwo(lines:Array<String>):Int {
		var x:Int = 0;
		var y:Int = 0;


		return x * y;
	}
}
