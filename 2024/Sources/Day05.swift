import Foundation

#if os(Linux)
    import Glibc
#endif

public class Day05: NSObject {

    let _inputPath: String
    let _inputData: [String]
    var _rules: [String: Int]
    var _pages: [String]

    override init() {
        _inputPath = "../inputs/Day05.txt"
        //_inputPath = "../inputs/Day05-Test.txt"
        _inputData = try! String(contentsOfFile: _inputPath).trimmingCharacters(in: .newlines)
            .components(separatedBy: .newlines)

        _rules = [:]
        _pages = []

        super.init()
    }

    func Part1() {
        var total: Int = 0
        parseInput()

        for p in _pages {
            var subTotal: Int = 0
            let pageList = p.split(separator: ",")

            for i in 0...pageList.count - 2 {
                let ruleKey: String = "\(pageList[i])|\(pageList[i+1])"

                if _rules[ruleKey] != nil {
                    subTotal += 1
                } else {
                    break
                }
            }

            if subTotal == pageList.count - 1 {
                let middle: Int = Int(pageList.count / 2)
                total += Int(pageList[middle])!
            }
        }

        print("Day 05, Part 1: \(total)")
    }

    func Part2() {
        var total: Int = 0

        print("Day 05, Part 2: \(total)")
    }

    func parseInput() {
        var isRules: Bool = true

        for line in _inputData {
            if line.count == 0 {
                isRules = false
                continue
            }

            if isRules {
                _rules[line] = 1
            } else {
                _pages.append(line)
            }
        }

    }
}
