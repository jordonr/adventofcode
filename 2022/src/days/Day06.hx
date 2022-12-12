package days;

import haxe.iterators.StringKeyValueIterator;
import utils.ReadData;
import helder.Set;

class Day06 {
	public function new(path:String) {
		var data:String = ReadData.getFileTrimmed(path);
        // data = "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw";

		Sys.println('Part 1: ' + partOne(data, 4));
		Sys.println('Part 2: ' + partOne(data, 14));
	}

	private function partOne(data:String, frameLength:Int):Int {
		var signal = data.split('');
        var count = frameLength - 1;
        var window = signal.splice(0, count);

        while(signal.length > 0) {
            count++;
            window.push(signal.shift());
            
            var windowSet = new Set<String>(window);
            if(windowSet.toArray().length == frameLength) {
                
                trace(window);
                return count;
            }

            window.shift();
        }

		return 0;
	}
}
