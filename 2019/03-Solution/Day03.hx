package ;

using Math;
using StringTools;

/****
Part 1 -
Here are a few more examples:
    R75,D30,R83,U83,L12,D49,R71,U7,L72
    U62,R66,U55,R34,D71,R55,D58,R83 = distance 159
    R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51
    U98,R91,D20,R16,D67,R40,U7,R15,U6,R7 = distance 135
Part 2 - 
    R75,D30,R83,U83,L12,D49,R71,U7,L72
    U62,R66,U55,R34,D71,R55,D58,R83 = 610 steps
    R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51
    U98,R91,D20,R16,D67,R40,U7,R15,U6,R7 = 410 steps
***/

class Day03 {
  private static inline var inputPath:String = "../inputs/Day03.txt";
  //private static inline var inputPath:String = "../inputs/Day1-Test.txt";
  private static var input:String = "";

  static public function main() {
    input = sys.io.File.getContent(inputPath).trim();
    var lineRegex = ~/\n/g;
    var splitRegex = ~/,/g;
    var splitCoords = ~/\|/g;
    var lines:Array<String> = lineRegex.split(input);
    var wires:Array<Map<String, Int>> = new Array();
    var minDistance:Float = -1;
    var minSteps:Int = -1;

    for(l in 0...lines.length) {
      var commands:Array<String> = splitRegex.split(lines[l]);
      var cx:Int = 0;
      var cy:Int = 0;
      var totalSteps:Int = 0;

      wires[l] = new Map();
      
      for(command in commands) {
        var dir:String = command.substr(0, 1);
        var steps:Int = Std.parseInt(command.substr(1));

        for(i in 0...steps) {
          if(dir == "U") {
            cy++;
          } else if(dir == "D") {
            cy--;
          } else if(dir == "L") {
            cx--;
          } else if(dir == "R") {
            cx++;
          }
          
          totalSteps++;
          wires[l].set('$cx|$cy', totalSteps);
        }
      }
    }

    // trace(wires[0]);
    // trace("\n\n\n");
    // trace(wires[0].exists('-10000|-1347'));

    for(currentWire in 0...wires.length-1) {
      for(position in wires[currentWire].keys()) {
        if(wires[currentWire+1].exists(position)) {
          var coords = splitCoords.split(position);
          var dist = Math.abs(Std.parseInt(coords[0])) + Math.abs(Std.parseInt(coords[1]));
          var steps = wires[currentWire][position] + wires[currentWire+1][position];

          if(minDistance == -1 || dist < minDistance) {
            minDistance = dist;
          }

          if(minSteps == -1 || steps < minSteps) {
            minSteps = steps;
          }
        }
      }
    }

    Sys.println('Minium Distance: ' + minDistance);
    Sys.println('Minium Steps: ' + minSteps);
    
  }
}
