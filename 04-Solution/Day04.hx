package;

using Math;
using StringTools;
using haxe.Int64;

/****
	Part 1 -
	byr (Birth Year)
	iyr (Issue Year)
	eyr (Expiration Year)
	hgt (Height)
	hcl (Hair Color)
	ecl (Eye Color)
	pid (Passport ID)
	cid (Country ID) (Optional)

	Part 2 -
	These slopes would find 2, 7, 3, 4, and 2 tree(s) respectively; multiplied together, these produce the answer 336.
***/
class Day04 {
	private static inline var inputPath:String = "../inputs/Day04.txt";
	// private static inline var inputPath:String = "../inputs/Day04-Test.txt";
	private static var input:String = "";

	static public function main() {
		input = sys.io.File.getContent(inputPath).trim();
        // var lineRegex = ~/\n\n/g;
        var lineRegex = ~/\r\n\r\n/g; //Windows
		var passports:Array<String> = lineRegex.split(input);

		Sys.println('Part 1: ' + partOne(passports));
		// Sys.println('Part 2: ' + product);
	}

	private static function partOne(passports:Array<String>):Int {
		var valid = 0;
        var requiredFields = 7;
        var fieldRegex = ~/(\w{3}):/g;

		for (p in 0...passports.length) {
			var validFields = [
				"byr" => 0,
				"iyr" => 0,
				"eyr" => 0,
				"hgt" => 0,
				"hcl" => 0,
				"ecl" => 0,
				"pid" => 0
			];

            var pp = passports[p];
			while (fieldRegex.match(pp)) {
                var field = fieldRegex.matched(1);
                if(validFields.exists(field)) {
                    validFields[field] = 1;
                }
				pp = fieldRegex.matchedRight();
            }

            var fieldTest = 0;
            for(v in validFields) {
                fieldTest += v;
            }

            if(fieldTest == requiredFields) {
                valid++;
            }
		}

		return valid;
	}
}
