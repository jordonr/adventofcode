package days;

using haxe.Int64;
import utils.ReadData;

class Day05 {

    private var _ranges:Array<Array<Int64>>;
    private var _ids:Array<Int64>;


	public function new(path:String) {
		var input:String = ReadData.getFileTrimmed(path);
        _ranges = [];
        parseInput(input);

		Sys.println('Part 1: ' + partOne());
		// Sys.println('Part 2: ' + partTwo(lines));
	}

	private function partOne():Int {
		var count:Int = 0;
        _ranges.sort((a, b) -> Int64.compare(a[0], b[0]));

        for(i in _ids) {
            for(r in _ranges) {
                /**
                    Compares `a` and `b` in signed mode.
                    Returns a negative value if `a < b`, positive if `a > b`,
                    or 0 if `a == b`.
                **/
                if( Int64.compare(i, r[0]) >= 0 &&  Int64.compare(i, r[1]) <= 0) {
                    count++;
                    break;
                }

            }
		}
		
		return count;
	}

	private function partTwo(lines:Array<String>):Int {
		var count:Int = 0;
		
		for(i in _ids) {
		}

		return count;
	}

    private function parseInput(data:String) {
        var re = ~/(\d+)-(\d+)/;
        var parts = data.split("\n\n");

        _ids = parts[1].split("\n").map(Int64.parseString);

        for(r in parts[0].split("\n")) {
            if(re.match(r)) {
                _ranges.push([Int64.parseString(re.matched(1)), Int64.parseString(re.matched(2))]);
            }
        }
    }
}
