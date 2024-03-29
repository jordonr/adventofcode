package days;

using Math;
using StringTools;

import utils.ReadData;

/****
 * The list of items for each rucksack is given as characters all on a single line. 
 * A given rucksack always has the same number of items in each of its two compartments, 
 * so the first half of the characters represent items in the first compartment, 
 * while the second half of the characters represent items in the second compartment.
 * 
 * To help prioritize item rearrangement, every item type can be converted to a priority:
 * Lowercase item types a through z have priorities 1 through 26.
 * Uppercase item types A through Z have priorities 27 through 52.
 * 7333 too low
***/

class Day03 {
	var alphas:String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	var alphaValues:Map<String, Int> = [];
	
	public function new(path:String) {
		var lines:Array<String> = ReadData.getLinesTrimmed(path);
		//var lines:Array<String> = [
		//"vJrwpWtwJgWrhcsFMMfFFhFp",
		//"jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
		//"PmmdzqPrVvPwwTWBwg",
		//"wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn",
		//"ttgJtRGJQctTZtZT",
		//"CrZsJsPPZsGzwwsLwLmpwMDw"
		//];
		
		for(c in 0...alphas.length) {
			alphaValues.set(alphas.charAt(c), c+1);
		}

		Sys.println('Part 1: ' + partOne(lines));
		Sys.println('Part 2: ' + partTwo(lines));
	}

	private function partOne(lines:Array<String>):Int {
		var total:Int = 0;
		
		for(l in lines) {
			var halfway:Int = Std.int(l.length / 2);
			var pocket1 = l.substring(0, halfway);
			var pocket2 = l.substring(halfway, l.length);
			var uniquePocket:Array<String> = [];
			
			for(p in 0...halfway) {
				var item = pocket1.charAt(p);
				if(uniquePocket.indexOf(item) == -1) {
					uniquePocket.push(item);
				}
			}
			
			for(c in 0...uniquePocket.length) {
				if(pocket2.indexOf(uniquePocket[c]) > -1) {
					total += alphaValues[uniquePocket[c]];
				}
			}
		}

		return total;
	}

	private function partTwo(lines:Array<String>):Int {
		var count = 0;
		var totalLines = lines.length - 2;
		var total = 0;
		
		while(count < totalLines) {
			var bag1 = lines[count];
			var bag2 = lines[count + 1];
			var bag3 = lines[count + 2];
			var uniqueBag:Array<String> = [];
			
			for(p in 0...bag1.length) {
				var item = bag1.charAt(p);
				if(uniqueBag.indexOf(item) == -1) {
					uniqueBag.push(item);
				}
			}
			
			for(c in 0...uniqueBag.length) {
				if(bag2.indexOf(uniqueBag[c]) > -1 && bag3.indexOf(uniqueBag[c]) > -1) {
					total += alphaValues[uniqueBag[c]];
				}
			}
			
			count += 3;
		} 

		return total;
	}
}
