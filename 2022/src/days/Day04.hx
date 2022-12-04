package days;

import utils.ReadData;

/****
	Part 1 -
	Part 2 -
***/
class Day04 {

	public function new(path:String) {
		var lines:Array<String> = ReadData.getLines(path);
		//lines = [
			//'35-73,35-82',
			//'9-27,10-80',
			//'25-93,2-42',
			//'37-54,52-53'
		//];
		
		partOne(lines);
		partTwo(lines);
	}

	private function partOne(lines:Array<String>):Void {
		var total:Int = 0;
		var r = ~/,|-/g;
		
		for(l in lines) {
			var elfArea = r.split(l).map(Std.parseInt);
			
			if(elfArea[0] <= elfArea[2] && elfArea[1] >= elfArea[3]) {
				total++;
			} else if(elfArea[2] <= elfArea[0] && elfArea[3] >= elfArea[1]) {
				total++;
			}
		}
		
		Sys.println("Part 1:" + total);
	}
	
	private function partTwo(lines:Array<String>):Void {
		var total:Int = 0;
		var r = ~/,|-/g;
		
		for(l in lines) {
			var elfArea = r.split(l).map(Std.parseInt);
			
			if(elfArea[0] >= elfArea[2] && elfArea[0] <= elfArea[3]) {
				total++;
			} else if(elfArea[1] >= elfArea[2] && elfArea[1] <= elfArea[3]) {
				total++;
			} else if(elfArea[2] >= elfArea[0] && elfArea[2] <= elfArea[1]) {
				total++;
			} else if(elfArea[3] >= elfArea[0] && elfArea[3] <= elfArea[1]) {
				total++;
			}
		}
		
		Sys.println("Part 2:" + total);
	}
}
