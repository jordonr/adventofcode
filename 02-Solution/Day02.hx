package;

using Math;
using StringTools;

/****
Part 1 -

Part 2 - 

***/

class Day02 {
    private static inline var inputPath:String = "../inputs/Day02.txt";
    // private static inline var inputPath: String = "../inputs/Day02-Test.txt";
    private static var input: String = "";

    static public function main() {
        input = sys.io.File.getContent(inputPath).trim();
        var lineRegex = ~/\n/g;
        var lines: Array < String > = lineRegex.split(input);

        Sys.println('Part 1: ' + partOne(lines));
        Sys.println('Part 2: ' + partTwo(lines));
    }

    private static function partOne(lines:Array<String>): Int {
        var pwRegex = ~/(\d+)-(\d+)\s(\w):\s(\w+)/g;
        var valid = 0;

        for (i in 0...lines.length) {
            pwRegex.match(lines[i]);
            var charCount = 0;
            var password = pwRegex.matched(4);
            var testChar = pwRegex.matched(3);
            var max = Std.parseInt(pwRegex.matched(2));
            var min = Std.parseInt(pwRegex.matched(1));

            for(c in 0...password.length) {
                if(password.charAt(c) == testChar) {
                    charCount++;
                }
            }

            if(charCount >= min && charCount <= max) {
                valid++;
            }
        }

        return valid;
    }

    private static function partTwo(lines:Array<String>): Int {
        var pwRegex = ~/(\d+)-(\d+)\s(\w):\s(\w+)/g;
        var valid = 0;

        for (i in 0...lines.length) {
            pwRegex.match(lines[i]);
            var password = pwRegex.matched(4);
            var testChar = pwRegex.matched(3);
            var matchOne = Std.parseInt(pwRegex.matched(2)) - 1;
            var matchTwo = Std.parseInt(pwRegex.matched(1)) - 1;

            if((password.charAt(matchOne) == testChar && password.charAt(matchTwo) != testChar) || 
                password.charAt(matchTwo) == testChar && password.charAt(matchOne) != testChar) {
                valid++;
            }

        }

        return valid;
    }
}