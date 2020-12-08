package;

using Math;
using StringTools;

/****
	Part 1 -

	Part 2 -
	Used Part 1 to find the line that stared the loop, changed it from jmp to nop
***/
class Day08 {
	private static inline var inputPath:String = "../inputs/Day08.txt";
	// private static inline var inputPath:String = "../inputs/Day08-Test.txt";
	private static var input:String = "";

	static public function main() {
		input = sys.io.File.getContent(inputPath).trim();
		var instructions:Array<String> = input.split("\n");

		// Sys.println('Part 1: ' + partOne(instructions));
		Sys.println('Part 2: ' + partTwo(instructions));
	}

	private static function partOne(instructions:Array<String>):Int {
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

	private static function partTwo(instructions:Array<String>):Int {
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
