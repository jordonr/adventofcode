package days;

class Day10 {
	public function new(data:String) {
		partOne(data);
	}

	private function partOne(data:String):Void {
		var seed:String = data;
		var lookSay:String = "";
		for(l in 0...40) {
			var cIndex = seed.charAt(0);
			var track = "";
			for(c in 0...seed.length + 1) {
				if(c == 0) {
					track = seed.charAt(c);
				} else if(cIndex == seed.charAt(c)) {
					track += seed.charAt(c);
				} else {
					lookSay += track.length + seed.charAt(c-1);
					track = seed.charAt(c);
				}

				cIndex = seed.charAt(c);
			}
			
			if(lookSay == "") {
				lookSay = track;
			}

			seed = lookSay;
			lookSay = "";
		}

		Sys.println(seed.length);
	}
}

