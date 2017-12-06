package ;

import decoders.*;

using StringTools;

class DayFour {
  private static inline var inputPath:String = "input.txt";
  //private static inline var inputPath:String = "inputTest.txt";
  private static var input:String = "";

  static public function main() {
    input = sys.io.File.getContent(inputPath).trim();

    var room:Room = new Room(input);
    trace(room.decode());
  }
}

/*
aaaaa-bbb-z-y-x-123[abxyz] is a real room because the most common letters are a (5), b (3), and then a tie between x, y, and z, which are listed alphabetically.
a-b-c-d-e-f-g-h-987[abcde] is a real room because although the letters are all tied (1 of each), the first five are listed alphabetically.
not-a-real-room-404[oarel] is a real room.
totally-real-room-200[decoy] is not.
*/
