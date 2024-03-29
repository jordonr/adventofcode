package days;

import entities.*;

class Day01 {
	private static inline var walkPath:String = "R3, L5, R2, L2, R1, L3, R1, R3, L4, R3, L1, L1, R1, L3, R2, L3, L2, R1, R1, L1, R4, L1, L4, R3, L2, L2, R1, L1, R5, R4, R2, L5, L2, R5, R5, L2, R3, R1, R1, L3, R1, L4, L4, L190, L5, L2, R4, L5, R4, R5, L4, R1, R2, L5, R50, L2, R1, R73, R1, L2, R191, R2, L4, R1, L5, L5, R5, L3, L5, L4, R4, R5, L4, R4, R4, R5, L2, L5, R3, L4, L4, L5, R2, R2, R2, R4, L3, R4, R5, L3, R5, L2, R3, L1, R2, R2, L3, L1, R5, L3, L5, R2, R4, R1, L1, L5, R3, R2, L3, L4, L5, L1, R3, L5, L2, R2, L3, L4, L1, R1, R4, R2, R2, R4, R2, R2, L3, L3, L4, R4, L4, L4, R1, L4, L4, R1, L2, R5, R2, R3, R3, L2, L5, R3, L3, R5, L2, R3, R2, L4, L3, L1, R2, L2, L3, L5, R3, L1, L3, L4, L3";

	public function new() {
		trace("AoC Day 1!");
		var steps:Array<String> = walkPath.split(", ");
		var track:Tracker = new Tracker(0, 0);
		var trail:Trailer = new Trailer(0, 0);

		for (i in 0...steps.length) {
			track.move(steps[i]);
			trail.move(steps[i]);
			trace(steps[i] + ": " + track.getDirection() + " -> " + track.getLocation());
		}

		trace("Track:");
		trace(track.getLocation());
		trace(track.calcBlockDistance());
		trace("Trail:");
		trace(trail.getLocation());
		trace(trail.calcBlockDistance());
		trace(trail.getRepeats());
	}
}
