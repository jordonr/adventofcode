package days;

import utils.ReadData;

class Day04 {

	public function new(path:String) {
		var lines:Array<String> = ReadData.getLinesTrimmed(path);

		Sys.println('Part 1: ' + partOne(lines));
		// Sys.println('Part 2: ' + partTwo(lines));
	}

	private function partOne(lines:Array<String>):Int {
		var count:Int = 0;
		
		for(l in lines) {
            trace(l);
		}

		return count;
	}

	private function partTwo(lines:Array<String>):Int {
		var count:Int = 0;
		
		return count;
	}
}
