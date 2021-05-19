package days;

import decoders.*;
import utils.ReadData;

class Day06 {
	public function new(path:String) {
		var input:String = ReadData.getFile(path);

		var eggs:Scramble = new Scramble(input);
		var yoke:Sunny = new Sunny(input);
		trace(eggs.decode());
		trace(yoke.decode());
	}
}
