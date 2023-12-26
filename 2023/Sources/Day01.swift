import Foundation
#if os(Linux)
import Glibc
#endif

public class Day01: NSObject {

    let _inputPath:String

    override init() {
        _inputPath = "../inputs/Day01.txt"

        super.init()
    }

    func Part1() {
        let input:String = try! String(contentsOfFile: _inputPath)
        let inputLines:[String] = input.trimmingCharacters(in: .newlines).components(separatedBy: .newlines)
        var total:Int = 0

        for line in inputLines {
            let myNums:String = String(line.filter { "0123456789".contains($0) })
            let parts:[Int] = myNums.split(separator: "").map({Int($0)!})
            
            total += (parts.first! * 10) + parts.last!
        }

        print("Day 01, Part 1: \(total)")
    }

    func Part2() {
        let input:String = try! String(contentsOfFile: _inputPath)
        let inputLines:[String] = input.trimmingCharacters(in: .newlines).components(separatedBy: .newlines)
        let simpleNumbers = try! Regex("(one|two|three|four|five|six|seven|eight|nine|[0-9])")
        var total:Int = 0
        
        for line in inputLines {
            var firstNum:Int = 0
            var lastNum:Int = 0

            for c in 1...line.count {
                guard let found = try! simpleNumbers.firstMatch(in: String(line.prefix(c))) else { continue }
                firstNum = getPartValue(String(found.0))
                break
            }

            for c in 1...line.count {
                guard let found = try! simpleNumbers.firstMatch(in: String(line.suffix(c))) else { continue }
                lastNum = getPartValue(String(found.0))
                break
            }

            total += (firstNum * 10) + lastNum
        }

        print("Day 01, Part 2: \(total)")
    }

    func getPartValue(_ v:String) -> Int {
        let textNumbers:[String:Int] = ["one": 1, "two": 2, "three": 3, "four": 4, "five":5 , "six": 6, "seven": 7, "eight": 8, "nine": 9]

        if(v.count > 1) {
            return textNumbers[v]!
        } 

        return Int(v)!
    }

}
