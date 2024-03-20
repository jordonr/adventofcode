package days;

using StringTools;

import utils.ReadData;
import entities.Reindeer;

class Day14 {
	public function new(path:String) {
		var data:Array<String> = ReadData.getLines(path);
		race(data);
	}

	private function race(data:Array<String>):Void {
		// 		data = [
		// 			"Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds.",
		// 			"Dancer can fly 16 km/s for 11 seconds, but then must rest for 162 seconds."
		// 		];
		var max = 0;
		var maxPoints = 0;
		var seconds = 2503;
		// 		var seconds = 1000;
		var r = ~/can fly (\d+) km\/s for (\d+) seconds.* (\d+) seconds./g;
		var team:Array<Reindeer> = [];
		var dists:Array<Int> = [];

		for (line in data) {
			r.match(line);
			var speed = Std.parseInt(r.matched(1));
			var flightTime = Std.parseInt(r.matched(2));
			var restTime = Std.parseInt(r.matched(3));

			team.push(new Reindeer(speed, flightTime, restTime));
		}

		for (s in 0...seconds) {
			for (t in 0...team.length) {
				team[t].tick();
			}

			var winnerDistance = getMaxDistance(team);

			for (t in 0...team.length) {
				if (team[t].getDistance() == winnerDistance) {
					team[t].points++;
				}
			}
		}

		max = getMaxDistance(team);

		for (t in team) {
			maxPoints = (maxPoints < t.points ? t.points : maxPoints);
		}

		// part 2 2640 too high
		Sys.println('Part 1: ' + max);
		Sys.println('Part 2: ' + maxPoints);
	}

	private function getMaxDistance(team:Array<Reindeer>):Int {
		var max = 0;

		for (t in team) {
			max = (max < t.getDistance() ? t.getDistance() : max);
		}

		return max;
	}
}
