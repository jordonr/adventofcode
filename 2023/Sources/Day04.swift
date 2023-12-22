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
        let parse:String = "([\\d\\s]+)"

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

        print("Day 04, Part 1: \(total)")
    }

    func Part2() 
    {
        var total:Int = 0
        let parse:String = "([\\d\\s]+)"
        var cardTracker:[Int:Int] = [:]

        for l in 0..._inputData.count-1 {
            let parts = _inputData[l].matchesByRegex(for: parse)
            let winners = Set(parts[1].split(separator: " "))
            let numbers = Set(parts[2].split(separator: " "))
            let cardNumber = l+1

            cardTracker.updateValue((cardTracker[cardNumber] ?? 0)+1, forKey: cardNumber)

            var nextCard = cardNumber+1
            for num in numbers {
                if(winners.contains(num)) {
                    cardTracker.updateValue((cardTracker[cardNumber] ?? 0)+(cardTracker[nextCard] ?? 0), forKey: nextCard)
                    nextCard += 1
                }
            }
        }

        for card in cardTracker {
            total += card.value
        }

        print("Day 04, Part 2: \(total)")
    }
}
