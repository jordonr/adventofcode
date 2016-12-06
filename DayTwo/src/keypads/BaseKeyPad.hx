package keypads;

class BaseKeyPad {
  var current:Array<Int> = [1, 1];
  var move:Array<Int> = [0, 0];
  var momentum:Array<Int> = [0, 0];
  var keyCode:String = "";
  var keypad:Array<Array<Int>> = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];

  private function parseInput(input:String) : Array<Int> {
    var dir = [0,0];
    switch(input) {
      case 'U':
        dir = [-1,0];
      case 'D':
        dir = [1,0];
      case 'L':
        dir = [0,-1];
      case 'R':
        dir = [0,1];
      default:
        dir = [0,0];
    }
    return dir;
  }

}
