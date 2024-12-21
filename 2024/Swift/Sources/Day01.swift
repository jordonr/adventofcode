import Foundation
#if os(Linux)
import Glibc
#endif

public class Day01: NSObject {

    let _inputPath:String
    let _inputData:[String]

    override init() {
        _inputPath = "../inputs/Day01.txt"
        // _inputPath = "../inputs/Day01-Test.txt"
        _inputData = try! String(contentsOfFile: _inputPath).trimmingCharacters(in: .newlines).components(separatedBy: .newlines)

        super.init()
    }

    func Part1() {
        var leftIds:[Int] = [];
        var rightIds:[Int] = [];
        var total:Int = 0

        for line in _inputData {
            let parts:[Int] = line.split(separator: " ").map({Int($0)!})
            leftIds.append(parts[0])
            rightIds.append(parts[1])
        }

        leftIds.sort()
        rightIds.sort() 

        for i in 0...leftIds.count - 1{
            total += abs(leftIds[i] - rightIds[i])
        }

        print("Day 01, Part 1: \(total)")

        Part2(left: leftIds, right: rightIds)
    }

    func Part2(left: [Int], right:[Int]) {
        var total:Int = 0
        var counter:Int = 0

        for l in 0...left.count - 1 {
            counter = 0
            for r in 0...right.count - 1 {

                if right[r] > left[l] {
                    break
                }

                if right[r] == left[l] {
                    counter += 1
                }
            }

            total += left[l] * counter
        }

        print("Day 01, Part 2: \(total)")
    }
}
