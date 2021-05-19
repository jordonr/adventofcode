package days;

import display.*;
import utils.ReadData;

class Day08 {
	public function new(path:String) {
		var input:String = ReadData.getFile(path);

		// var screen:LCD = new LCD(7, 3);
		var screen:LCD = new LCD(50, 6);

		screen.decode(input);
		screen.display();
		trace(screen.countLitPixels());
	}
}
