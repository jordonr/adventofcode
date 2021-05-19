package days;

import keypads.*;
import utils.ReadData;

class Day02 {
	public function new(path:String) {
		var input:String = ReadData.getFile(path);
		var r = ~/\n/g;
		var lines:Array<String> = r.split(input);

		var square:Square = new Square();
		var diamon:Diamond = new Diamond();
		trace(square.start(lines));
		trace(diamon.start(lines));
	}
}
