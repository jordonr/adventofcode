package days;

import parsers.*;
import utils.ReadData;

class Day03 {
	public function new(path:String) {
		var input:String = ReadData.getFile(path);

		var row:Rows = new Rows(input);
		var column:Columns = new Columns(input);
		trace(row.parse());
		trace(column.parse());
	}
}
