import Foundation
#if os(Linux)
import Glibc
#endif

public class Day06: NSObject 
{
    let _inputPath:String
    let _inputData:[String]

    override init() 
    {
        _inputPath = "../inputs/Day06.txt"
        _inputData = try! String(contentsOfFile: _inputPath).trimmingCharacters(in: .newlines).components(separatedBy: .newlines)
        
        super.init()
    }

    func Part1() 
    {
        var total:Int = 0
        let times:[Int] = _inputData[0].matchesByRegex(for: "\\d+").map { Int($0)! }
        let dist:[Int] = _inputData[1].matchesByRegex(for: "\\d+").map { Int($0)! }
        var wins:[Int] = []

        for i in 0...times.count-1 {
            var count = 0
            for s in 2...times[i] {
                if((s * (times[i] - s)) > dist[i]) {
                    count += 1
                }
            }

            wins.append(count)
        }

        total = wins.reduce(1) { $0 * $1 }

        print("Day 06, Part 1: \(total)")
    }

    func Part2() 
    {
        var total:Int = 1

        let times:Int = Int(_inputData[0].filter { "0123456789".contains($0) })!
        let dist:Int = Int(_inputData[1].filter { "0123456789".contains($0) })!

        for s in 2...times {
            if((s * (times - s)) > dist) {
                total += 1
            }
        }

        print("Day 06, Part 2: \(total)")
    }

}
