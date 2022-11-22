package days;

import haxe.display.JsonModuleTypes.JsonTypeParameters;
import permutation.Permuter;
import utils.ReadData;

using Lambda;

class Day09 {
	public function new(path:String) {
		var data:Array<String> = ReadData.getLines(path);
		parseData(data);
	}

	private function parseData(data:Array<String>):Void {
		var distances:Map<String, Int> = new Map();
		var cities:Array<String> = [];
		var recordCities:Map<String, Int> = new Map();
		var r = ~/(\w+) to (\w+) = (\d+)/;

		for (line in data) {
			r.match(line);
			var start:String = r.matched(1);
			var end:String = r.matched(2);
			var dist:Int = Std.parseInt(r.matched(3));

			recordCities.set(start, 0);
			recordCities.set(end, 0);

			distances.set('${start}${end}', dist);
			distances.set('${end}${start}', dist);
		}

		for(c in recordCities.keys()) {
			cities.push(c);
		}

		var citiesPerm = new Permuter(cities);	
		var min:Int = 9999999;
		var max:Int = 0;

		for(p in citiesPerm) {
			var dist = 0;

			for(i in 0...p.length - 1) {
				dist += distances.get('${p[i]}${p[i+1]}');
			}

			if(dist > max) {
				max = dist;
			}

			if(min > dist) {
				min = dist;
			}
		}

		Sys.println('Min: ${min}, Max: ${max}');
	}
}

