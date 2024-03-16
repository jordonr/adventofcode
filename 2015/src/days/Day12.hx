package days;

using StringTools;

import haxe.Json;
import utils.ReadData;
import tjson.TJSON;

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
		//partOne(data, 1);
		partTwo(data);
	}

	private function partOne(data:String, part:Int):Void {
		var r = ~/(-?\d+),?/g;
		var jsonString = data;
		var total = 0;
		
		while(r.match(jsonString)) {
			total += Std.parseInt(r.matched(1));
			jsonString = r.matchedRight();
		}
		
		Sys.println('Part ' + part + ': ' + total);
	}

	private function partTwo(data:String):Void {				
		var total = 0;
		/*
		var rfr = ~/(?<={)[^{]+:"red"[^}]+(?=})/g;
		var rfr2 = ~/{[^}]+:"red"}/g;
		var rStillRed = ~/:"red"/g;

		//var cleaned = rfr.replace(data, '');
		//cleaned = rfr.replace(cleaned, '');
		//trace(cleaned);
		var cleaned = rfr2.replace(data, '');
		trace(cleaned.length);
		
		if(rStillRed.match(cleaned)) {
			partTwo(cleaned);
		}
		
		partOne(cleaned, 2);
		// To High:121262
		// To Low:  34639
		*/
		var jsonData = TJSON.parse(data);
		
		trace(jsonData);
		
		//for(e in jsonData) {
			//trace(e);
		//}
	}
}

