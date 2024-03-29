package days;

using StringTools;

import utils.ReadData;
import permutation.Permuter;

class Day13 {
	public function new(path:String) {
		var data:Array<String> = ReadData.getLines(path);
		sitPeople(data, 1);
		sitPeople(data, 2);
	}

	private function sitPeople(data:Array<String>, part:Int):Void {
		var max = 0;
		// Groups: person gain|lose value friend
		var r = ~/^(\w+) would (gain|lose) (\d+) happiness units by sitting next to (\w+)./g;
		var tableValues = new Map<String, Map<String, Int>>();
		var people = new Map<String, String>();

		for (line in data) {
			r.match(line);
			var person:String = r.matched(1);
			people.set(person, person);
			if (!tableValues.exists(person)) {
				tableValues[person] = new Map<String, Int>();
			}

			var friend:String = r.matched(4);
			var value:Int = Std.parseInt(r.matched(3));
			var plusMinus:String = r.matched(2);
			if (plusMinus == "lose") {
				value *= -1;
			}

			tableValues[person].set(friend, value);
		}

		var peopleArray = new Array<String>();

		if (part == 2) {
			peopleArray.push("Me");
			tableValues["Me"] = new Map<String, Int>();
		}

		for (k in people.keys()) {
			peopleArray.push(k);
			if (part == 2) {
				tableValues["Me"].set(k, 0);
				tableValues[k].set("Me", 0);
			}
		}

		var peoplePerms = new Permuter(peopleArray);

		for (p in peoplePerms) {
			var total:Int = 0;

			for (i in 0...p.length) {
				var left:Int = (i == 0 ? p.length - 1 : i - 1);
				var right:Int = (i == p.length - 1 ? 0 : i + 1);
				total += tableValues[p[i]][p[left]] + tableValues[p[i]][p[right]];
			}

			max = (total > max ? total : max);
		}

		Sys.println('Part ' + part + ': ' + max);
	}
}
