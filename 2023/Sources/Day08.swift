import Foundation
#if os(Linux)
import Glibc
#endif

public class Day08: NSObject 
{
    let _inputPath:String
    let _inputData:[String]
    var _dirs:[String]
    var _mapData:[String:[String:String]] 
    var _startingPoints:[String]

    override init() 
    {
        _inputPath = "../inputs/Day08.txt"
        _inputData = try! String(contentsOfFile: _inputPath).trimmingCharacters(in: .newlines).components(separatedBy: .newlines)
        _dirs = _inputData[0].split(separator: "").map { String($0) }
        _mapData = [:]
        _startingPoints = []
        
        
        super.init()
    }

    func Part1() 
    {
        _mapData = storeCoords()

        var nextPoint:String = "AAA"
        var steps:Int = 0
        var di:Int = 0

        while(nextPoint != "ZZZ") {
            nextPoint = _mapData[nextPoint]![_dirs[di]]!
            steps += 1
            di += 1

            if(di >= _dirs.count) {
                di = 0
            }
        }

        print("Day 08, Part 1: \(steps)")
    }

    func Part2() 
    {
        var lcm:Int = 0
        var di:Int = 0
        var endingSteps:[Int] = []
        
        for s in _startingPoints {
            var nextPoint:String = s
            var steps:Int = 0

            while(nextPoint.last != "Z") {
                nextPoint = _mapData[nextPoint]![_dirs[di]]!
                steps += 1
                di += 1

                if(di >= _dirs.count) {
                    di = 0
                }
            }

            endingSteps.append(steps)
            
        }

        lcm = endingSteps.max() ?? 0
        for e in endingSteps {
            lcm = (e * lcm) / gcd(e, lcm)
        }

        print("Day 08, Part 2: \(lcm)")
    }

    func storeCoords() -> [String:[String:String]]
    {
        var mapParts:[String:[String:String]] = [:]

        for l in 2..._inputData.count-1 {
            let parts:[String] = _inputData[l].matchesByRegex(for: "\\w+")

            mapParts.updateValue(["L": parts[1], "R": parts[2]], forKey: parts[0])

            if(parts[0].last == "A") {
                _startingPoints.append(parts[0])
            }
        }

        return mapParts
    }

    func gcd(_ l:Int, _ r:Int) -> Int
    {
        if(r == 0) {
            return l;
        }

        return gcd(r, (l % r))
    }

}
