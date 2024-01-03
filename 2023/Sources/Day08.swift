import Foundation
#if os(Linux)
import Glibc
#endif

public class Day08: NSObject 
{
    let _inputPath:String
    let _inputData:[String]

    override init() 
    {
        _inputPath = "../inputs/Day08.txt"
        _inputData = try! String(contentsOfFile: _inputPath).trimmingCharacters(in: .newlines).components(separatedBy: .newlines)
        
        super.init()
    }

    func Part1() 
    {
        let dirs:[String] = _inputData[0].split(separator: "").map { String($0) }
        let map:[String:[String:String]] = storeCoords()
        var nextPoint:String = "AAA"
        var steps:Int = 0
        var di:Int = 0

        while(nextPoint != "ZZZ") {
            nextPoint = map[nextPoint]![dirs[di]]!
            steps += 1;
            di += 1;

            if(di >= dirs.count) {
                di = 0
            }
        }

        print("Day 08, Part 1: \(steps)")
    }

    func Part2() 
    {
        var total:Int = 1


        print("Day 08, Part 2: \(total)")
    }

    func storeCoords() -> [String:[String:String]]
    {
        var mapParts:[String:[String:String]] = [:]

        for l in 2..._inputData.count-1 {
            let parts:[String] = _inputData[l].matchesByRegex(for: "\\w+")

            mapParts.updateValue(["L": parts[1], "R": parts[2]], forKey: parts[0])
        }

        return mapParts
    }

}
