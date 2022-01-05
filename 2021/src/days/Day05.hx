package days;

import haxe.exceptions.PosException;

using StringTools;

import haxe.Json;
import utils.ReadData;

typedef Point = {x:Int, y:Int};

/****
	Part 1 -
	Part 2 -
***/
class Day05 {
	public function new(path:String) {
		var lines:Array<String> = ReadData.getLines(path);

		Sys.println('Part 1: ' + partOne(lines));
		Sys.println('Part 2: ' + partTwo(lines));
	}

	private function partOne(lines:Array<String>):Int {
		var grid:Map<String, Int> = new Map();

		for (line in lines) {
			var points = parsePoints(line);
			var tempPoint:Point = {x: null, y: null};

			if (points.point1.x == points.point2.x || points.point1.y == points.point2.y) {
				var dist:Int = Std.int(pointDistance(points.point1, points.point2));
				tempPoint = points.point1;
				if (points.point1.x != points.point2.x) {
					if (points.point1.x > points.point2.x) {
						tempPoint = points.point2;
					}
				} else if (points.point1.y != points.point2.y) {
					if (points.point1.y > points.point2.y) {
						tempPoint = points.point2;
					}
				}

				var json:String = Json.stringify(points.point1);
				var value:Int = (grid.get(json) != null ? grid.get(json) : 0);
				grid.set(json, value + 1);

				json = Json.stringify(points.point2);
				value = (grid.get(json) != null ? grid.get(json) : 0);
				grid.set(json, value + 1);

				for (i in 0...dist - 1) {
					if (points.point1.x == points.point2.x) {
						tempPoint.y++;
					} else if (points.point1.y == points.point2.y) {
						tempPoint.x++;
					}

					json = Json.stringify(tempPoint);
					value = (grid.get(json) != null ? grid.get(json) : 0);
					grid.set(json, value + 1);
				}

				tempPoint = {x: null, y: null};
			}
		}

		var total:Int = 0;
		for (key in grid.keys()) {
			if (grid[key] >= 2) {
				total++;
			}
		}

		return total;
	}

	private function partTwo(numbers:Array<String>):Int {
		var deeper:Int = 0;

		return deeper;
	}

	private function parsePoints(input:String) {
		// 0,9 -> 5,9
		var pointRegex = ~/(\d+),(\d+) -> (\d+),(\d+)/g;
		pointRegex.match(input);

		return {
			point1: {x: Std.parseInt(pointRegex.matched(1)), y: Std.parseInt(pointRegex.matched(2))},
			point2: {x: Std.parseInt(pointRegex.matched(3)), y: Std.parseInt(pointRegex.matched(4))}
		};
	}

	private function pointDistance(a:Point, b:Point):Float {
		return Math.sqrt(Math.pow(b.x - a.x, 2) + Math.pow(b.y - a.y, 2));
	}
}
