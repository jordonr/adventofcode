package days;

using StringTools;
using Lambda;

import utils.ReadData;
import haxe.DynamicAccess;
import haxe.Json;
import Type.typeof;

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
		// partOne(data);
		partTwo(data);
	}

	private function partOne(data:String):Void {
		var r = ~/(-?\d+),?/g;
		var jsonString = data;
		var total = 0;

		while (r.match(jsonString)) {
			total += Std.parseInt(r.matched(1));
			jsonString = r.matchedRight();
		}

		Sys.println('Part 1: ' + total);
	}

	private function partTwo(data:String):Void {
		var total = 0;
		var jsonData = Json.parse(data);

		total = parseNumbers(jsonData);

		Sys.println('Part 2: ' + total);
	}

	private function parseNumbers(dyn:Dynamic):Int {
		var data:DynamicAccess<Dynamic> = dyn;
		var sum = 0;
		switch (typeof(data)) {
			case TInt:
				sum += cast(data, Int);
			case TClass(Array):
				sum += parseArray(data);
			case TObject:
				sum += parseObject(data);
			case _:
		}
		return sum;
	}

	private function parseObject(dyn:Dynamic):Int {
		var obj:DynamicAccess<Dynamic> = dyn;
		var sum = 0;
		for (k => v in obj) {
			// skip objects with red key
			switch (typeof(v)) {
				case TClass(String):
					if (cast(v, String) == "red")
						return 0;
				case _:
			}
			sum += parseNumbers(v);
		}
		return sum;
	}

	private function parseArray(dyn:Dynamic):Int {
		var array:Array<Dynamic> = dyn;
		var sum = 0;
		for (i in array)
			sum += parseNumbers(i);
		return sum;
	}
}
