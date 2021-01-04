package days;

import haxe.macro.CompilationServer.ContextOptions;
import haxe.CallStack.StackItem;
import utils.ReadData;

class Day07 {
	var wires = new Map<String, Int>();
	var instructions = new Map<String, String>();

	public function new(path:String) {
		// path = "../inputs/Day07-Test.txt";
		var data:Array<String> = ReadData.getLines(path);
		setInstructions(data);
		Sys.println('Part 1: ' + partOne(data, "a"));
		Sys.println('Part 2: ' + partTwo(data, "a"));
	}

	private function partOne(data:Array<String>, wire:String):Int {
		findWires(wire);

		return getValue(wire);
	}

	private function partTwo(data:Array<String>, wire:String):Int {
		var awire:Int = partOne(data, "a");
		wires = new Map<String, Int>();
		wires.set("b", awire);
		findWires(wire);

		return getValue(wire);
	}

	private function findWires(wire:String):Int {
		var inst:Array<String> = instructions[wire].split(" ");

		if (inst[1] == "->") {
			var p1 = getValue(inst[0]);
			wires.set(inst[2], p1);
		} else if (inst[0] == "NOT") {
			var p1 = getValue(inst[1]);
			wires.set(inst[3], ~p1 + 65536);
		} else {
			var p1 = getValue(inst[0]);
			var p2 = getValue(inst[2]);

			if (p1 != null && p2 != null) {
				switch (inst[1]) {
					case "AND":
						wires.set(inst[4], p1 & p2);

					case "OR":
						wires.set(inst[4], p1 | p2);

					case "LSHIFT":
						wires.set(inst[4], p1 << p2);

					case "RSHIFT":
						wires.set(inst[4], p1 >> p2);
				}
			}
		}

		return getValue(inst[inst.length - 1]);
	}

	private function setInstructions(data:Array<String>):Void {
		for (line in data) {
			var inst = line.split(" ");
			instructions.set(inst[inst.length - 1], line);
		}
	}

	private function getValue(input:String):Int {
		if (wires.exists(input)) {
			return wires.get(input);
		} else if (Std.parseInt(input) != null) {
			return Std.parseInt(input);
		}

		return findWires(input);
	}
}
