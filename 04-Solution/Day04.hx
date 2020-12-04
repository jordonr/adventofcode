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
	byr (Birth Year) - four digits; at least 1920 and at most 2002.
	iyr (Issue Year) - four digits; at least 2010 and at most 2020.
	eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
	hgt (Height) - a number followed by either cm or in:
		If cm, the number must be at least 150 and at most 193.
		If in, the number must be at least 59 and at most 76.
	hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
	ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
	pid (Passport ID) - a nine-digit number, including leading zeroes.
	cid (Country ID) - ignored, missing or not.

***/
class Day04 {
	private static inline var inputPath:String = "../inputs/Day04.txt";
	// private static inline var inputPath:String = "../inputs/Day04-Test.txt";
	private static var input:String = "";

	static public function main() {
		input = sys.io.File.getContent(inputPath).trim();
		var lineRegex = ~/\n\n/g;
		// var lineRegex = ~/\r\n\r\n/g; // Windows
		var passports:Array<String> = lineRegex.split(input);

		Sys.println('Part 1: ' + partOne(passports));
		Sys.println('Part 2: ' + partTwo(passports));
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
				if (validFields.exists(field)) {
					validFields[field] = 1;
				}
				pp = fieldRegex.matchedRight();
			}

			var fieldTest = 0;
			for (v in validFields) {
				fieldTest += v;
			}

			if (fieldTest == requiredFields) {
				valid++;
			}
		}

		return valid;
	}

	private static function partTwo(passports:Array<String>):Int {
		var valid = 0;
		var requiredFields = 7;
		var fieldRegex = ~/(\w{3}):([\w\d#]+)/g;

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
			var validEyeColor = ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"];

			var pp = passports[p];
			while (fieldRegex.match(pp)) {
				var field = fieldRegex.matched(1);
				var value = fieldRegex.matched(2);

				switch field {
					case "byr": // byr (Birth Year) - four digits; at least 1920 and at most 2002.
						var year:Int = Std.parseInt(value);
						if (year >= 1920 && year <= 2002) {
							validFields[field] = 1;
						}
					case "iyr": // iyr (Issue Year) - four digits; at least 2010 and at most 2020.
						var year:Int = Std.parseInt(value);
						if (year >= 2010 && year <= 2020) {
							validFields[field] = 1;
						}
					case "eyr": // eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
						var year:Int = Std.parseInt(value);
						if (year >= 2020 && year <= 2030) {
							validFields[field] = 1;
						}
					case "hgt": // hgt (Height) - a number followed by either cm or in:
						var height:Int = Std.parseInt(value);
						// If cm, the number must be at least 150 and at most 193.
						// If in, the number must be at least 59 and at most 76.
						if ((value.endsWith("cm") && height >= 150 && height <= 193)
							|| (value.endsWith("in") && height >= 59 && height <= 76)) {
							validFields[field] = 1;
						}
					case "hcl": // hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
						var hexColorRegex = ~/^#[a-f0-9]{6}/g;
						if (hexColorRegex.match(value) && value.length == 7) {
							validFields[field] = 1;
						}
					case "ecl": // ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
						if (validEyeColor.contains(value)) {
							validFields[field] = 1;
						}
					case "pid": // pid (Passport ID) - a nine-digit number, including leading zeroes.
						var pidRegex = ~/^\d{9}/g;
						if (pidRegex.match(value) && value.length == 9) {
							validFields[field] = 1;
						}
					default:
						// trace("Ignored Field: " + field + ": " + value);
				}
				pp = fieldRegex.matchedRight();
			}

			var fieldTest = 0;
			for (v in validFields) {
				fieldTest += v;
			}

			if (fieldTest == requiredFields) {
				valid++;
			}
		}
		return valid;
	}
}
