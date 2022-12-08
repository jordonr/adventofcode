package days;

import haxe.exceptions.PosException;

using StringTools;

import haxe.Json;
import utils.ReadData;

/****
	Part 1 -
	Part 2 -
***/
class Day05 {
	var stacks:Array<Array<String>> = [[]];
	var instructions:Array<String> = [];

	public function new(path:String) {
		var lines:Array<String> = ReadData.getLines(path);
		var seperator = lines.indexOf('');
		
		var stackInfo:Array<String> = lines.slice(0, seperator);
		instructions = lines.slice(seperator+1);

		populateStacks(stackInfo);

		Sys.println('Part 1: ');
		partOne(instructions);
		// Sys.println('Part 2: ' + partTwo(lines));
	}

	function partOne(instructions:Array<String>):Void {
		var r = ~/move (\d+) from (\d+) to (\d+)/g;

		for(i in instructions) {
			var instuct = i;

			while(r.match(instuct)) {
				var numBoxes = Std.parseInt(r.matched(1));
				var from = Std.parseInt(r.matched(2));
				var to = Std.parseInt(r.matched(3));

				moveCrates(numBoxes, from, to);
				instuct = r.matchedRight();
			}
		}

		printStack();
	}

	function partTwo(numbers:Array<String>):Int {
		var deeper:Int = 0;

		return deeper;
	}

	function populateStacks(description:Array<String>):Void {
		var regCrate = ~/(.{3})\s?/;
		description.reverse();
		var stackSize = description.shift();
		stacks[0] = [];

		while(regCrate.match(stackSize)) {
			var column = Std.parseInt(regCrate.matched(1));
			stacks[column] = [];
			stackSize = regCrate.matchedRight();
		}

		for(d in description) {
			var column = 1;
			var container = d;
			
			while(regCrate.match(container)) {
				var box = regCrate.matched(1);
			
				if(box.contains("[")) {
					stacks[column].push(box);
				}

				container = regCrate.matchedRight();
				column++;
			}
		}
	}

	function moveCrates(loops:Int, from:Int, to:Int) {
		for(c in 0...loops) {
			stacks[to].push(stacks[from].pop());
		}
	}

	function printStack() {
		for(s in stacks) {
			for(c in s) {
				Sys.print(c);
			}

			Sys.print("\n");
		}
	}

	
}
