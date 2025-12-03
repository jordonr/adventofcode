package days;

using StringTools;
using haxe.Int64;

import utils.ReadData;

class Day02 {

	public function new(path:String) {
		var ranges:Array<String> = ReadData.getFileTrimmed(path).split(",");

		// Sys.println('Part 1: ' + partOne(ranges));
		Sys.println('Part 2: ' + partTwo(ranges));
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

    // About the same speed but a little cleaner
	private function partOne_Regex(ranges:Array<String>):Int64 {
		var count:Int64 = 0;
        var dups_reg = ~/(?<!\d)(\d+)(?=.*\1)/g;
		
		for(r in ranges) {
            var start_end = r.split("-");
            var test:Int64 = Int64.parseString(start_end[0]);
            var end:Int64 = Int64.parseString(start_end[1]);

            while(test <= end) {
                var si = Std.string(test);
                var t = dups_reg.match(si);

                if(t && dups_reg.matchedRight() == dups_reg.matched(1)) {
                    count += test;
                }

                test++;
            }
		}

		return count;
	}

    private function partTwo(ranges:Array<String>):Int64 {
		var count:Int64 = 0;
        var dups_reg = ~/^(.*)\1+$/g;
		
		for(r in ranges) {
            var start_end = r.split("-");
            var test:Int64 = Int64.parseString(start_end[0]);
            var end:Int64 = Int64.parseString(start_end[1]);

            while(test <= end) {
                var si = Std.string(test);

                if(dups_reg.match(si)) {

                    var result = StringTools.replace(si, dups_reg.matched(1), "");

                    if(result.length == 0) {
                        count += test;
                    }
                }

                test++;
            }
		}

		return count;
	}
}