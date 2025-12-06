package days;

import haxe.exceptions.ArgumentException;
import utils.ReadData;

class Day04 {

	private var _grid:Array<Array<String>>;
	private var _height:Int;
	private var _width:Int;
	private var _search_coords:Array<Array<Int>>;

	public function new(path:String) {
		var lines:Array<String> = ReadData.getLinesTrimmed(path);
		_search_coords = [
			[-1, -1],
			[0, -1],
			[1, -1],
			[-1, 0],
			[1, 0],
			[-1, 1],
			[0, 1],
			[1, 1]
		];

		_grid = [];
		for(l in lines) {
            _grid.push(l.split(""));
		}

		_height = _grid.length;
		_width = _grid[0].length;

		Sys.println('Part 1: ' + partOne(lines));
		Sys.println('Part 2: ' + partTwo(lines));
	}

	private function partOne(lines:Array<String>):Int {
		var count:Int = 0;
		
		count = removeTp();

		return count;
	}

	private function partTwo(lines:Array<String>):Int {
		var count:Int = 0;
		var prev_count:Int = -1;

		while(count != prev_count) {
			prev_count = count;
			count += removeTp(true);
		}
		
		return count;
	}

	private function removeTp(repalce:Bool = false):Int {
		var count:Int = 0;

		for(y in 0..._height) {
			for(x in 0..._width) {
				if(_grid[y][x] == "@" && fourTest(x, y)) {
					count++;

					if(repalce) {
						_grid[y][x] = ".";
					}
				}
			}
		}

		return count;
	}

	private function fourTest(x:Int, y:Int):Bool {
		var tp:Array<String> = [];

		for(i in 0...8) {
			tp.push(safeGetValue(x + _search_coords[i][0], y + _search_coords[i][1]));
		}

		if(tp.filter(n -> n == "@").length < 4) {
			return true;
		}

		return false;
	}

	private function safeGetValue(x:Int, y:Int):String {

		if(x < 0 || y < 0 || x > _width - 1 || y > _height - 1) {
			return ".";
		}

		return _grid[y][x];
	}
}
