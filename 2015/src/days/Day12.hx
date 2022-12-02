package days;

import utils.ReadData;

class Day12 {
	/**
	 * Part 1:
	 * 
For example:

    [1,2,3] and {"a":2,"b":4} both have a sum of 6.
    [[[3]]] and {"a":{"b":4},"c":-1} both have a sum of 3.
    {"a":[-1,1]} and [-1,{"a":1}] both have a sum of 0.
    [] and {} both have a sum of 0.

    * 
	**/
	
	public function new(path:String) {
		var data:String = ReadData.getFile(path);
		partOne(data);
	}

	private function partOne(data:String):Void {
		var r = ~/(-?\d+),?/g;
		var jsonString = data;
		var total = 0;
		
		while(r.match(jsonString)) {
			total += Std.parseInt(r.matched(1));
			jsonString = r.matchedRight();
		}
		
		Sys.println('Part 1: ' + total);
		
	}
}

