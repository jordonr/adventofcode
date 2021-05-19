package days;

import parsers.*;
import utils.ReadData;

class Day07 {
	public function new(path:String) {
		var input:String = ReadData.getFile(path);

		var ips:IP7 = new IP7(input);
		var ssl:SSL = new SSL(input);
		trace(ips.valid());
		trace(ssl.valid());
	}
}
