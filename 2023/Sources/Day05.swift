import Foundation
import Glibc 

public class Day05: NSObject 
{
    let _inputPath:String
    let _inputData:[String]
    var seeds:[Int]

    override init() 
    {
        _inputPath = "../inputs/Day05.txt"
        _inputData = try! String(contentsOfFile: _inputPath).trimmingCharacters(in: .newlines).components(separatedBy: .newlines)
        seeds = []

        super.init()
    }

    func Part1() 
    {
        seeds = _inputData[0].matchesByRegex(for: "\\d+").map { Int($0)! }

        for s in 0...seeds.count-1 {
            var skipToNext:Bool = false

            for l in 2..._inputData.count-1 {
                let line:String = _inputData[l]

                if(line.count == 0) {
                    skipToNext = false
                    continue
                } else if(!line.charAt(0).isNumber || skipToNext) {
                    continue
                }

                let numbers = line.matchesByRegex(for: "\\d+").map { Int($0)! }
                let destRange = numbers[0]...(numbers[0] + numbers[2] - 1)
                let sourceRange = numbers[1]...(numbers[1] + numbers[2] - 1)

                if(sourceRange.contains(seeds[s])) {
                    seeds[s] = (seeds[s] - sourceRange.first!) + destRange.first!
                    skipToNext = true
                }
            }
        }

        print("Day 05, Part 1: \(seeds.min()!)")
    }

    func Part2() 
    {
        // var total:Int = 0

        // print("Day 05, Part 2: \(total)")
    }
}
