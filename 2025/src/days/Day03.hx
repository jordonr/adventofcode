package days;

using haxe.Int64;
import utils.ReadData;

class Day03 {

	public function new(path:String) {
		var lines:Array<String> = ReadData.getLinesTrimmed(path);

		// Sys.println('Part 1: ' + partOne(lines));
		Sys.println('Part 2: ' + partTwo(lines));
	}

	private function partOne(lines:Array<String>):Int {
		var count:Int = 0;
		
		for(l in lines) {
            var num_list:Array<Int> = l.split("").map(Std.parseInt);
            var num_idx = 0;
            var max1 = 0;
            var max2 = 0; 

            for(i in 0...num_list.length-1) {
                if(num_list[i] > max1) {
                    max1 = num_list[i];
                    num_idx = i+1;
                }
            }

            for(i in num_idx...num_list.length) {
                if(num_list[i] > max2) {
                    max2 = num_list[i];
                }
            }

            count += max1*10 + max2;
		}

		return count;
	}

	private function partTwo(lines:Array<String>):Int64 {
		var count:Int64 = 0;
		
        for(l in lines) {
            var num_list:Array<Int> = l.split("").map(Std.parseInt);
            var builder:Array<Int> = [];

            for(i in 0...11) {
                var battery = maxArray(num_list.slice(0, i-11));
                builder.push(battery);
                num_list = num_list.slice(num_list.indexOf(battery)+1);
            }
            builder.push(maxArray(num_list));

            count += Int64.parseString(builder.join(''));
        }

        return count;
	}

    private function maxArray(numbers:Array<Int>):Int {
        numbers.sort((a, b) -> b - a);
        return numbers.shift();
    }
}