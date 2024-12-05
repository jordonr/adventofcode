package days;

import utils.ReadData;

using StringTools;

class Day07 {
	private var _rootTower:String;

	public function new(path:String) {
		var data:Array<String> = ReadData.getLines(path);
		partOne(data);
		partTwo(data);
	}

	private function partOne(data:Array<String>):Void {
		var base = "";
		var children = [];
		var parents = [];
		var rParents = ~/(\w+)\s\((\d+)\)/g;

		for (line in data) {
			var splitLine = line.split("->");

			if (splitLine.length > 1) {
				rParents.match(splitLine[0]);
				parents.push(rParents.matched(1));
				children = children.concat(splitLine[1].trim().split(", "));
			}
		}

		for (p in parents) {
			if (!children.contains(p)) {
				_rootTower = p;
				break;
			}
		}

		Sys.println('Part 1: ' + _rootTower);
	}

	private function partTwo(data:Array<String>):Void {
		var badWeight = 0;
		var previousWeight = 0;
		var parrentChildren:Map<String, Array<String>> = new Map<String, Array<String>>();
		var programWeight:Map<String, Int> = new Map<String, Int>();
		var towerWeight:Map<String, Array<Int>> = new Map<String, Array<Int>>();
		var parents = [];
		var rParents = ~/(\w+)\s\((\d+)\)/g;

		for (line in data) {
			var splitLine = line.split("->");
			rParents.match(splitLine[0]);

			programWeight.set(rParents.matched(1), Std.parseInt(rParents.matched(2)));

			if (splitLine.length > 1) {
				var currentParent = rParents.matched(1);
				var currentChildren = splitLine[1].trim().split(", ");
				parents.push(currentParent);
				parrentChildren.set(currentParent, currentChildren);
			}
		}

		function findUnbalanced(tower:String):Void {

			if(!parrentChildren.exists(tower)) {
				return;
			}
	
			var weight:Int = programWeight[tower];
			for (c in parrentChildren[tower]) {
				findUnbalanced(c);
				weight += programWeight[c]; 
			}

			trace(tower, weight);
	
			if(!towerWeight.exists(tower)) {
				towerWeight[tower] = new Array<Int>();
			}	
			
			towerWeight[tower].push(weight);
		}

		
		findUnbalanced(_rootTower);

		trace(towerWeight);

		for (p => cArray in parrentChildren) {
			var inspector:Map<Int, String> = new Map<Int, String>();
			for(c in cArray) {
				trace(p, towerWeight[c]);
				if(towerWeight.exists(c)) {
					trace(towerWeight[c]);
					// inspector.set(towerWeight[c], p);
				}
			}

			trace(inspector);
		}

		Sys.println('Part 2: ' + badWeight);

		
	}

}
