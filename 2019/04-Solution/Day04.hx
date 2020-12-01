package ;

using Math;
using StringTools;

/****
Part 1 -
However, they do remember a few key facts about the password:

    It is a six-digit number.
    The value is within the range given in your puzzle input.
    Two adjacent digits are the same (like 22 in 122345).
    Going from left to right, the digits never decrease; they only ever increase or stay the same (like 111123 or 135679).

Other than the range rule, the following are true:

    111111 meets these criteria (double 11, never decreases).
    223450 does not meet these criteria (decreasing pair of digits 50).
    123789 does not meet these criteria (no double).

Part 2 -
An Elf just remembered one more important detail: the two adjacent matching digits are not part of a larger group of matching digits.

Given this additional criterion, but still ignoring the range rule, the following are now true:

    112233 meets these criteria because the digits never decrease and all repeated digits are exactly two digits long.
    123444 no longer meets the criteria (the repeated 44 is part of a larger group of 444).
    111122 meets the criteria (even though 1 is repeated more than twice, it still contains a double 22).

***/

class Day04 {
  private static var input:String = "206938-679128";

  static public function main() {
    var splitRegex = ~/-/g;
    var minMax: Array<String> = splitRegex.split(input);
    var min:Int = Std.parseInt(minMax[0]);
    var max:Int = Std.parseInt(minMax[1]);
    var current:Int = min;
    var part1:Int = 0;
    var part2:Int = 0;

    while(current < max) {
      current++;
      if(compliance(current)) {
        part1++;
      }

      if(compliance(current, 2)) {
        part2++;
      }
    }

    Sys.println("Part 1:");
    Sys.println(part1);
    Sys.println("Part 2:");
    Sys.println(part2);
  }

  private static function compliance(passcode:Int, ?part:Int = 1): Bool {
    var code:String = Std.string(passcode);
    var cdeo:String = sortNumbers(code);

    if(code != cdeo) {
      return false;
    }

    for(i in 0...code.length-1) {
      if(part == 1) {
        if(code.charAt(i) == code.charAt(i+1)) {
          return true;
        }
      } else if(part == 2) {
        if(code.charAt(i) == code.charAt(i+1) && code.charAt(i) != code.charAt(i+2) && code.charAt(i) != code.charAt(i-1)) {
          return true;
        }
      }
    }
    return false;
  }

  private static function sortNumbers(a:String): String {
    var arr:Array<String> = a.split('');
    arr.sort(function(a, b) return a > b ? 1 : -1);
    return arr.join('');
  }
}
