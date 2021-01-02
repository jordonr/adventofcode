package days;

using Math;
using StringTools;

import utils.ReadData;

/****
	Part 1 -

	Part 2 -
	Used Part 1 to find the line that stared the loop, changed it from jmp to nop
***/
class Day08 {
	public function new(path:String) {
		var instructions:Array<String> = ReadData.getLines(path);
		Sys.println('Part 1: ' + partOne(instructions));
		// Sys.println('Part 2: ' + partTwo(instructions));
	}

	private function partOne(instructions:Array<String>):Int {
		var acc:Int = 0;
		var oppTracker:Array<Int> = [];
		var run:Bool = true;
		var line:Int = 0;

		while (run) {
			var oppcode = instructions[line].split(" ");
			oppTracker.push(line);

			switch oppcode[0] {
				case "acc":
					line++;
					acc += Std.parseInt(oppcode[1]);
				case "jmp":
					line += Std.parseInt(oppcode[1]);
				case "nop":
					line++;
			}

			if (oppTracker.indexOf(line) > -1) {
				run = false;
			}
		}

		return acc;
	}

	private function partTwo(instructions:Array<String>):Int {
		var acc:Int = 0;
		var oppTracker:Array<Int> = [];
		var run:Bool = true;
		var line:Int = 0;

		while (run) {
			var oppcode = instructions[line].split(" ");
			oppTracker.push(line);

			switch oppcode[0] {
				case "acc":
					line++;
					acc += Std.parseInt(oppcode[1]);
				case "jmp":
					line += Std.parseInt(oppcode[1]);
				case "nop":
					line++;
			}

			if (line >= instructions.length) {
				run = false;
			}
		}

		return acc;
	}
}
