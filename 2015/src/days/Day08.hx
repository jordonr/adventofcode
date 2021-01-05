package days;

import utils.ReadData;

class Day08 {
	public function new(path:String) {
		var data:Array<String> = ReadData.getLines(path);
		Sys.println('Part 1: ' + partOne(data));
		Sys.println('Part 2: ' + partTwo(data));
	}

	private function partOne(data:Array<String>):Int {
		var totalChars:Int = 0;
		var memoryChars:Int = 0;

		for (line in data) {
			totalChars += line.length;
			memoryChars += process(line);
		}

		return totalChars - memoryChars;
	}

	private function partTwo(data:Array<String>):Int {
		var totalChars:Int = 0;
		var memoryChars:Int = 0;

		for (line in data) {
			totalChars += line.length;
			memoryChars += encode(line);
		}

		return memoryChars - totalChars;
	}

	private function process(str:String):Int {
		var processed = ~/\\x[a-f0-9]{2}/g.replace(str, "@");
		processed = ~/\\{2}/g.replace(processed, "$");
		processed = ~/\\"/g.replace(processed, "~");
		processed = ~/^"|"$/g.replace(processed, "");

		return processed.length;
	}

	private function encode(str:String) {
		var processed = ~/\\/g.replace(str, "\\\\");
		processed = ~/"/g.replace(processed, '\\"');
		processed = '"' + processed + '"';

		return processed.length;
	}
}
