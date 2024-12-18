import Foundation

#if os(Linux)
    import Glibc
#endif

public class Day03: NSObject {

    let _inputPath: String
    let _inputData: [String]

    override init() {
        _inputPath = "../inputs/Day03.txt"
        //_inputPath = "../inputs/Day03-Test.txt"
        _inputData = try! String(contentsOfFile: _inputPath).trimmingCharacters(in: .newlines)
            .components(separatedBy: .newlines)

        super.init()
    }

    func Part1() {
        var total: Int = 0
        let needle: String = "mul\\((\\d{1,3}),(\\d{1,3})\\)"

        for line in _inputData {
            let muls: [String] = line.matchesByRegex(for: needle)

            for m in 0...muls.count - 1 {
                let mul: [Int] = muls[m].split(separator: ",").map {
                    $0.filter { "0123456789".contains($0) }
                }.map { Int($0)! }
                total += mul[0] * mul[1]
            }
        }

        print("Day 03, Part 1: \(total)")
    }

    func Part2() {
        var total: Int = 0
        let needle: String = "(do\\(\\))|(don't\\(\\))|mul\\((\\d{1,3}),(\\d{1,3})\\)"
        var doer: Bool = true

        for line in _inputData {
            let commands: [String] = line.matchesByRegex(for: needle)

            for c in 0...commands.count - 1 {
                if commands[c].contains("do()") {
                    doer = true
                } else if commands[c].contains("don't()") {
                    doer = false
                } else if doer && commands[c].contains("mul(") {
                    let mul: [Int] = commands[c].split(separator: ",").map {
                        $0.filter { "0123456789".contains($0) }
                    }.map { Int($0)! }
                    total += mul[0] * mul[1]
                }
            }
        }

        print("Day 03, Part 2: \(total)")
    }
}
