package;

using StringTools;

class Day05 {
    private static inline var inputPath:String = "../inputs/Day5.txt";
    // private static inline var inputPath: String = "../inputs/Day5-Test.txt";
    private static var input: String = "";

    static public function main() {
        input = sys.io.File.getContent(inputPath).trim();

        // Part 1
        var remainder: String = polyermize(input);
        Sys.println("Part 1: " + remainder.length);

        // Part 2
        Sys.println("Part 2:");
        var lowLen: Int = input.length;
        var output: String = "";
        var reducedPoly = unique(input);
        for (char in reducedPoly) {
            var rahc: String = flipCase(char);
            var newChain: String = StringTools.replace(input, char, "");
            newChain = StringTools.replace(newChain, rahc, "");

            var mod: String = polyermize(newChain);

            Sys.println("  " + char + ": " + mod.length);

            if(mod.length < lowLen) {
                output = "Winner - " + char + ": " + mod.length;
                lowLen = mod.length;
            }
        }

        Sys.println(output);
    }

    private static function polyermize(polyString: String): String {
        var retPoly: String = polyString;
        var beenMatched: Bool = false;
        for (c in 0...polyString.length - 1) {
            if (polyString.charAt(c) == flipCase(polyString.charAt(c + 1))) {
                var temp: String = polyString.charAt(c) + polyString.charAt(c + 1);
                retPoly = StringTools.replace(retPoly, temp, "");
                beenMatched = true;
            }
        }

        if (beenMatched) {
            retPoly = polyermize(retPoly);
        }

        return retPoly;
    }

    private static function flipCase(char: String): String {
        if (char.toUpperCase() == char) {
            return char.toLowerCase();
        } else {
            return char.toUpperCase();
        }
    }

    private static function unique(myStr: String): Array<String> {
        var retArray: Array<String> = new Array<String>();

        for (c in 0...myStr.length) {
            var upperChar: String = myStr.charAt(c).toUpperCase();
            if(retArray.indexOf(upperChar) == -1) {
                retArray.push(upperChar);
            }
        }

        return retArray;
    }
}