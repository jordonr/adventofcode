import days.*;

class Main {
	public function new() {
		#if (day == 1)
		// var day:Day01 = new Day01("../inputs/Day01-Test.txt");
		var day:Day01 = new Day01("../inputs/Day01.txt");
		#elseif (day == 2)
		// var day:Day02 = new Day02("../inputs/Day02-Test.txt");
		var day:Day02 = new Day02("../inputs/Day02.txt");
		#elseif (day == 3)
		var day:Day03 = new Day03("../inputs/Day03.txt");
		#elseif (day == 4)
		// var day:Day04 = new Day04("../inputs/Day04-Test.txt");
		var day:Day04 = new Day04("../inputs/Day04.txt");
		#elseif (day == 5)
		// var day:Day05 = new Day05("../inputs/Day05-Test.txt");
		var day:Day05 = new Day05("../inputs/Day05.txt");
		#elseif (day == 6)
		var day:Day06 = new Day06("../inputs/Day06.txt");
		#elseif (day == 7)
		var day:Day07 = new Day07("../inputs/Day07.txt");
		#elseif (day == 8)
		var day:Day08 = new Day08("../inputs/Day08.txt");
		#elseif (day == 9)
		var day:Day09 = new Day09("../inputs/Day09.txt");
		#elseif (day == 10)
		// var day:Day10 = new Day10("../inputs/Day10-TestB.txt");
		var day:Day10 = new Day10("../inputs/Day10.txt");
		#elseif (day == 11)
		// var day:Day11 = new Day11("../inputs/Day11-Test.txt");
		var day:Day11 = new Day11("../inputs/Day11.txt");
		#elseif (day == 12)
		var day:Day12 = new Day12("../inputs/Day11.txt");
		#end
	}

	public static function main() {
		new Main();
	}
}
