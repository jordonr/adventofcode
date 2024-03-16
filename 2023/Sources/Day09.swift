import Foundation
#if os(Linux)
import Glibc
#endif

public class Day09: NSObject 
{
    let _inputPath:String
    let _inputData:[String]

    override init() 
    {
        _inputPath = "../inputs/Day09.txt"
        _inputData = try! String(contentsOfFile: _inputPath).trimmingCharacters(in: .newlines).components(separatedBy: .newlines)
        
        super.init()
    }

    func Part1() 
    {
        var total:Int = 0

        for line in _inputData {
            let history:[Int] = line.split(separator: " ").map { Int($0)! }
            var storage:[[Int]] = []
            var checker:Int = -1
            var prevRow:[Int] = history

            while(checker != 0) {
                var nextRow:[Int] = []
                storage.append(prevRow)
                for i in 1...prevRow.count-1 {
                    nextRow.append(prevRow[i] - prevRow[i-1])
                }

                prevRow = nextRow 
                checker = nextRow.filter { $0 != 0 }.reduce(0) { $0 + $1 }
            }

            for s in storage {
                total += s.last ?? 0
            }
            
        }

        print("Day 09, Part 1: \(total)")
    }

    func Part2() 
    {
        var total:Int = 0

        print("Day 09, Part 2: \(total)")
    }

}
