package days;

using StringTools;

import haxe.Json;
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
		// partOne(data, 1);
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
		// To High:121262
				
		var total = 0;
		var rfr = ~/(?<={)[^{]+:"red"[^}]+(?=})/g;
		var rfr2 = ~/{[^}]+:"red"}/g;

		var cleaned = clean(data);

		trace(cleaned);

		// trace(cleaned.length);
		// cleaned = rfr.replace(cleaned, '');
		// trace(cleaned.length);
		// var cleaned = rfr2.replace(cleaned, '');
		// trace(cleaned.length);
		
		// partOne(cleaned, 2);
		
	}

	private function clean(data:String):String {
		var bs = ~/{/g;
		var be = ~/}/g;
		var nl = ~/\n/g;
		var bad = ~/\n{.*:"red".*}\n/g;
		var red = ~/:"red"/g;
		
		data = bs.replace(data, "\n{");
		data = be.replace(data, "}\n");
		data = bad.replace(data, '');
		data = nl.replace(data, '');

		trace(data.length);

		if(data.length == 31209) {
			trace(data);
			Sys.exit(0);
		}
		

		if(red.match(data)) {
			data = clean(data);
		}

		
		
		return data;
		
		// partOne(cleaned, 2);
		
	}

	// private function listObjects(data:String):Array<String> {
	// 	var parseMe:String = data;
	// 	var objects:Array<String> = [];
	// 	var objectLine:String = "";
	// 	var startBraceAt:Int = 0;
	// 	var endBraceAt:Int = 0;
	// 	var braceFound:Bool = false;
	// 	var redFound:Bool = false;

	// 	// parseMe = '{"e":70,"a":"green","d":"blue","j":12,"c":69,"h":"orange","b":92,"g":"yellow","f":"green","i":121}';

	// 	for(c in 0...parseMe.length) {
			
	// 		if(parseMe.charAt(c) == "{" && !braceFound) {
	// 			braceFound = true;
	// 			startBraceAt = c;
	// 		} else if(parseMe.charAt(c) == "}") {
	// 			braceCounter--;
	// 		} else if(parseMe.substr(c, 6) == ':"red"') {
	// 			redFound = true;
	// 		}

	// 		if(braceCounter == 0 && braceFound) {
	// 			if(redFound) {
	// 				objects.push(objectLine);
	// 				redFound = false;
	// 			}
				
	// 			braceFound = false;
	// 			objectLine = "";
	// 		}
	// 	}

	// 	return objects;
	// }
}

