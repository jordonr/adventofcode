package entities;

class Tracker {
  private var startX:Int = 0;
  private var startY:Int = 0;
  private var x:Int = 0;
  private var y:Int = 0;
  private var compass:String = 'N';

  public function new(x:Int, y:Int) {
    this.x = x;
    this.startX = x;
    this.y = y;
    this.startY = y;
  }

  public function getDirection() : String {
    return this.compass;
  }

  public function getLocation() : Array<Int> {
    return [this.x, this.y];
  }

  public function getStartLocation() : Array<Int> {
    return [this.startX, this.startY];
  }

  public function move(direction:String) : Void {
    var blocks:Int = Std.parseInt(direction.substr(1));

    this.parseDirection(direction);

    switch(this.compass) {
      case "N":
        this.y += blocks;
      case "S":
        this.y -= blocks;
      case "E":
        this.x += blocks;
      case "W":
        this.x -= blocks;
      default:
        trace("Not one of the four!");
    }
  }

  public function calcBlockDistance() : Int {
    return cast(Math.abs(this.x - this.startX) + Math.abs(this.y - this.startY), Int);
  }

  private function parseDirection(direction:String) : Void {
    var turn:String = direction.charAt(0);
    var newCompass:String = "";

    switch(this.compass) {
      case "N":
        if(turn == "R") {
          newCompass = "E";
        } else if(turn == "L") {
          newCompass = "W";
        }
      case "S":
        if(turn == "R") {
          newCompass = "W";
        } else if(turn == "L") {
          newCompass = "E";
        }
      case "E":
        if(turn == "R") {
          newCompass = "S";
        } else if(turn == "L") {
          newCompass = "N";
        }
      case "W":
        if(turn == "R") {
          newCompass = "N";
        } else if(turn == "L") {
          newCompass = "S";
        }
      default:
        newCompass = this.compass;
    }

    this.compass = newCompass;
  }
}
