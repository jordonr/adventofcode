package keypads;

using StringTools;

class Square extends BaseKeyPad {
  public function new() {
    current = [1, 1];
    keypad = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ];
  }

  public function start(lines:Array<String>) : String {

    for(i in 0...lines.length) {
      var lc = lines[i].trim();

      for(c in 0...lc.length) {
        momentum = parseInput(lc.charAt(c));
        for(i in 0...momentum.length) {
          move[i] = momentum[i] + current[i];
          if(move[i] <= 2 && move[i] >= 0) {
            current[i] = move[i];
          }
        }
      }
      keyCode += keypad[current[0]][current[1]];
    }

    return keyCode;
  }
}
