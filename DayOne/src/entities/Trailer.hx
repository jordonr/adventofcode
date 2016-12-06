package entities;

class Trailer extends Tracker {
  private var trail:Array<String> = [];
  private var repeats:Array<Array<Int>> = [];

  public function getTrail() : Array<String> {
    return trail;
  }

  public function getRepeats() : Array<Array<Int>> {
    return repeats;
  }

  public override function move(direction:String) : Void {
    var blocks:Int = Std.parseInt(direction.substr(1));

    this.parseDirection(direction);

    for(i in 0...blocks) {
      switch(this.compass) {
        case "N":
          this.y++;
        case "S":
          this.y--;
        case "E":
          this.x++;
        case "W":
          this.x--;
        default:
          trace("Not one of the four!");
      }

      if(this.trail.indexOf(this.getLocation().toString()) > -1) {
        trace('Visted Before: ' + this.getLocation().toString() + " | Distance: " + this.calcBlockDistance());
        this.repeats.push(this.getLocation());
      }

      this.trail.push(this.getLocation().toString());
    }
  }
}
