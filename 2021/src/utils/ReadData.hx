package utils;

using StringTools;

class ReadData {
	public static function getFile(path:String):String {
		var input:String = sys.io.File.getContent(path).trim();

		return input;
	}

	public static function getLines(path:String):Array<String> {
		var input:String = getFile(path);
		var lineRegex = ~/\n/g;
		var lines:Array<String> = lineRegex.split(input);

		return lines;
	}
}
