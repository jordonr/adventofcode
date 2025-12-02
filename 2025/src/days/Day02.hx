package days;

using StringTools;
using haxe.Int64;

import utils.ReadData;

class Day02 {

	public function new(path:String) {
		var ranges:Array<String> = ReadData.getFileTrimmed(path).split(",");

		Sys.println('Part 1: ' + partOne(ranges));
		// Sys.println('Part 2: ' + partTwo(lines));
	}

	private function partOne(ranges:Array<String>):Int64 {
		var count:Int64 = 0;
		
		for(r in ranges) {
            var start_end = r.split("-");
            var test:Int64 = Int64.parseString(start_end[0]);
            var end:Int64 = Int64.parseString(start_end[1]);

            while(test <= end) {
                var si = Std.string(test);

                // 101 would be invaild 
                if(Std.string(si).length%2 != 0) {
                    test++;
                    continue;
                }
                
                var left = si.substr(0, Math.ceil(si.length/2));
                var right = si.substr(Math.ceil(si.length/2));

                if(left == right) {
                    count += test;
                }

                test++;
            }

		}

		return count;
	}

	private function partTwo(lines:Array<String>):Int {
		var count:Int = 0;
		

		return count;
	}
}
