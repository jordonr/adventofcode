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
	var stackOne:Array<Array<String>> = [[]];
	var stackTwo:Array<Array<String>> = [];
	var instructions:Array<String> = [];
	var stackInfo:Array<String> = [];
	var regInstuct = ~/move (\d+) from (\d+) to (\d+)/g;

	public function new(path:String) {
		var lines:Array<String> = ReadData.getLines(path);
		var seperator = lines.indexOf('');
		
		stackInfo = lines.slice(0, seperator);
		instructions = lines.slice(seperator+1);

		populateStacks(stackInfo);

		Sys.println('Part 1: ');
		partOne(instructions);
		Sys.println("\nPart 2: ");
		partTwo(instructions);
	}

	function partOne(instructions:Array<String>):Void {
		
		for(i in instructions) {
			var instuct = i;

			if(regInstuct.match(instuct)) {
				var numBoxes = Std.parseInt(regInstuct.matched(1));
				var from = Std.parseInt(regInstuct.matched(2));
				var to = Std.parseInt(regInstuct.matched(3));

				moveCrates(numBoxes, from, to);
			}
		}

		printStack(stackOne);
	}

	function partTwo(numbers:Array<String>):Void {
		for(i in instructions) {
			var instuct = i;

			if(regInstuct.match(instuct)) {
				var numBoxes = Std.parseInt(regInstuct.matched(1));
				var from = Std.parseInt(regInstuct.matched(2));
				var to = Std.parseInt(regInstuct.matched(3));

				moveCrates9001(numBoxes, from, to);
			}
		}

		printStack(stackTwo);
	}

	function populateStacks(description:Array<String>):Void {
		var regCrate = ~/(.{3})\s?/;
		description.reverse();
		var stackSize = description.shift();
		stackOne[0] = [];

		while(regCrate.match(stackSize)) {
			var column = Std.parseInt(regCrate.matched(1));
			stackOne[column] = [];
			stackSize = regCrate.matchedRight();
		}

		for(d in description) {
			var column = 1;
			var container = d;
			
			while(regCrate.match(container)) {
				var box = regCrate.matched(1);
			
				if(box.contains("[")) {
					stackOne[column].push(box);
				}

				container = regCrate.matchedRight();
				column++;
			}
		}

		for(s in stackOne) {
			stackTwo.push(s.copy());
		}
	}

	function moveCrates(loops:Int, from:Int, to:Int) {
		for(c in 0...loops) {
			stackOne[to].push(stackOne[from].pop());
		}
	}

	function moveCrates9001(num:Int, from:Int, to:Int) {
		var temp = stackTwo[to].concat(stackTwo[from].splice(num * -1, num));
		stackTwo[to] = temp;
	}

	function printStack(stacks:Array<Array<String>>) {
		for(s in stacks) {
			for(c in s) {
				Sys.print(c);
			}

			Sys.print("\n");
		}
	}

	
}
