package keypads;

using StringTools;

class Diamond extends BaseKeyPad {
  public function new() {
    current = [2, 0];
    keypad = [
      [0, 0, 1, 0, 0],
      [0, 2, 3, 4, 0],
      [5, 6, 7, 8, 9],
      [0, 'A', 'B', 'C', 0],
      [0, 0, 'D', 0, 0]
    ];
  }

  public function start(lines:Array<String>) : String {

    for(i in 0...lines.length) {
      var lc = lines[i].trim();

      for(c in 0...lc.length) {
        momentum = parseInput(lc.charAt(c));
        move[0] = momentum[0] + current[0];
        move[1] = momentum[1] + current[1];

        try {
          if(keypad[move[0]][move[1]] != 0 && keypad[move[0]][move[1]] != null) {
            current[0] = move[0];
            current[1] = move[1];
          }
        } catch(e:Dynamic) {
          //trace(e);
          continue; //Horrible!
        }
        //trace(lc.charAt(c) + "|" + move + ":" + current + "=>" + keypad[current[0]][current[1]]);
      }
      keyCode += keypad[current[0]][current[1]];
    }

    return keyCode;
  }
}
