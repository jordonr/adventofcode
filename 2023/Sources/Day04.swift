import Foundation
import Glibc 

public class Day04: NSObject 
{
    let _inputPath:String
    let _inputData:[String]

    override init() 
    {
        _inputPath = "../inputs/Day04.txt"
        _inputData = try! String(contentsOfFile: _inputPath).trimmingCharacters(in: .newlines).components(separatedBy: .newlines)
        super.init()
    }

    func Part1() 
    {
        var total:Decimal = 0
        let parse:String = ": ([\\d\\s]+) | ([\\d\\s]+)"

        for line in _inputData {
            var power:Int = -1
            let parts = line.matchesByRegex(for: parse)
            let winners = parts[1].split(separator: " ")
            let numbers = parts[2].split(separator: " ")

            for num in numbers {
                if(winners.contains(num)) {
                    power += 1
                }
            }

            if(power > -1) {
                total += pow(2, power)
            }
        }

        print("Day 02, Part 1: \(total)")
    }
}
