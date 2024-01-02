import Foundation
#if os(Linux)
import Glibc
#endif

struct PokerHand {
    var hand:String = ""
    var bet:Int = 0
    var value:Int = 0
}

public class Day07: NSObject 
{
    let _inputPath:String
    let _inputData:[String]
    let _cardValue:[String:String]
    var _handRanking:[PokerHand]

    override init() 
    {
        _inputPath = "../inputs/Day07.txt"
        _inputData = try! String(contentsOfFile: _inputPath).trimmingCharacters(in: .newlines)
            .components(separatedBy: .newlines)
        _cardValue = ["2": "2", "3": "3", "4": "4", "5": "5", "6": "6", "7": "7", "8": "8", 
            "9": "9", "T": "A", "J": "B", "Q": "C", "K": "D", "A": "E"]
        _handRanking = []
        
        super.init()
    }

    func Part1() 
    {
        var total:Int = 0

        for line in _inputData {
            // 32T3K 765, Hand Bet
            let parts = line.split(separator: " ")
            var play = PokerHand() 
            play.hand = String(parts[0])
            play.bet = Int(parts[1]) ?? 0
            play.value = getHandValue(play.hand)

            _handRanking.append(play)
        }

        let sortedHand = _handRanking.sorted(by: { a, b in 
            return a.value < b.value 
        })

        for h in 0...sortedHand.count-1 {
            total += (h+1) * sortedHand[h].bet
        }
 
        print("Day 07, Part 1: \(total)")
    }

    func Part2() 
    {
        var total:Int = 1

        print("Day 07, Part 2: \(total)")
    }

    func getHandValue(_ hand:String) -> Int {
        // Max Raw: 978670 = AAAAA
        // Of Kind Score: Of Kind * 10,000,000
        // Full House + 5,000,000
        // 2 Pair + 1,000,000
        var cards:[String:Int] = [:]
        let parts:[String] = hand.split(separator: "").map { String($0) }
        let raw:String = parts.map { _cardValue[$0] ?? "" }.joined(separator: "")
        var value = Int(raw, radix: 16) ?? 0

        for c in parts {
            cards.updateValue((cards[c] ?? 0)+1, forKey: c)
        }

        value += cards.max { $0.value < $1.value }!.value * 10000000

        if(cards.count == 2) {
            value += 5000000
        } else if(cards.count == 3) {
            value += 1000000
        }

        return value
    }

}
