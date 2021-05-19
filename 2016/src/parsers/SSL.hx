package parsers;

using StringTools;

class SSL {
	private var splitLine = ~/\n/g;
	private var lines:Array<String> = [];
	private var totalValid:Int = 0;

	public function new(input) {
		lines = splitLine.split(input);
		totalValid = 0;
	}

	private function parse(part:String, list:String):Int {
		for (c in 0...part.length) {
			if (part.charAt(c + 1) == part.charAt(c - 1)
				&& (part.charAt(c) != part.charAt(c + 1) || part.charAt(c) != part.charAt(c - 1))) {
				var aba:String = part.charAt(c - 1) + part.charAt(c) + part.charAt(c + 1);
				var bab:String = part.charAt(c) + part.charAt(c + 1) + part.charAt(c);

				if (list.indexOf(bab) != -1) {
					return 1;
				}
			}
		}

		return 0;
	}

	public function valid():Int {
		var fieldList:String = "";
		var bracketList:String = "";
		var inBracket:Bool = false;

		for (line in lines) {
			line = line.trim();
			var c:Int = 0;
			while (c < line.length) {
				if (line.charAt(c) == "[") {
					c++;
					inBracket = true;
				} else if (line.charAt(c) == "]") {
					bracketList += "|";
					inBracket = false;
				}

				if (inBracket) {
					bracketList += line.charAt(c);
				} else {
					fieldList += line.charAt(c);
				}

				c++;
			}

			totalValid += parse(fieldList, bracketList);

			bracketList = "";
			fieldList = "";
		}

		return totalValid;
	}
}
