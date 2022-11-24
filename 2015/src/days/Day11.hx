package days;

class Day11 {
	/**
	 * Part 1:
	 * 
    Passwords must include one increasing straight of at least three letters, like abc, bcd, cde, and so on, up to xyz. They cannot skip letters; abd doesn't count.
    Passwords may not contain the letters i, o, or l, as these letters can be mistaken for other characters and are therefore confusing.
    Passwords must contain at least two different, non-overlapping pairs of letters, like aa, bb, or zz.
    * 
	**/

	var alphabet = "abcdefghijklmnopqrstuvwxyz";
	
	public function new(data:String) {
		//~ partOne(data);
		partOne("abcdefgh");

	}

	private function partOne(data:String):Void {
		var testPw:String = data;

		if(checkAlpha(testPw) && checkBadChars(testPw) && checkDoubles(testPw)) {
			Sys.println("Part 1: " + testPw);
		} else {
			incrementPassword(testPw, 0);
		}
	}

	private function incrementPassword(pass:String, index:Int) {
		var alphabetIndex:Int;
		var temp = pass.split('');
		temp.reverse();
		var again:Bool = true;

		trace(pass);
		trace(index);

		if(alphabet.indexOf(temp[index]) >= 24) {
			alphabetIndex = 0;
		} else {
			alphabetIndex = alphabet.indexOf(temp[index]) + 1;
		}
		
		var nextChar:String = alphabet.charAt(alphabetIndex);

		temp[index] = nextChar;
		temp.reverse();

		if(alphabetIndex == 0) {
			incrementPassword(temp.join(''), index++);
		}

		return temp.join('');
	}

	// Passwords must include one increasing straight of at least three letters, like abc, bcd, cde, and so on, up to xyz. They cannot skip letters; abd doesn't count.
	private function checkAlpha(pass:String):Bool {
		for(c in 0...pass.length - 2) {
			var segment:String = pass.charAt(c) + pass.charAt(c + 1) + pass.charAt(c + 2);

			if(alphabet.indexOf(segment) > -1) {
				return true;
			}
		}
		
		return false;
	}	

	// Passwords may not contain the letters i, o, or l, as these letters can be mistaken for other characters and are therefore confusing.
	private function checkBadChars(pass:String):Bool {
		var r = ~/[iol]+/g;

		return !r.match(pass);
	}

	// Passwords must contain at least two different, non-overlapping pairs of letters, like aa, bb, or zz.
	private function checkDoubles(pass:String):Bool {
		var r = ~/(([a-z])\2+)/g;
		var matches = [];
		var input = pass;
		
		while (r.match(input)) {
			matches.push(r.matched(0)); 
			input = r.matchedRight();
		}

		if(matches.length > 1) {
			return true;
		}
		
		return false;
	}
}

