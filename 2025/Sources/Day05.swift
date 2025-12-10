import Foundation

#if os(Linux)
    import Glibc
#endif

public class Day05: NSObject {

    let _inputPath: String
    let _inputData: [String]
    var _ranges: [[Int]]

    override init() {
        _inputPath = "../inputs/Day05.txt"
        // _inputPath = "../inputs/Day05-Test.txt"
        _inputData = try! String(contentsOfFile: _inputPath, encoding: .ascii ).trimmingCharacters(in: .newlines)
            .components(separatedBy: "\n\n")
        _ranges = []

        super.init()

        parseInput()
    }

    func Part2() {
        var total: Int = 0
        var last_range: [Int] = []

        for r: [Int] in _ranges {
            if last_range.count == 0 {
                last_range = r
            } else if last_range[1] < r[0] {
                total = total + last_range[1] - last_range[0] + 1
                last_range = r
            } else {
                last_range = [last_range[0], max(last_range[1], r[1])]
            }
        }

        total = total + last_range[1] - last_range[0] + 1

        print("Day 05, Part 2: \(total)")
    }

    func parseInput() {
        let lines:[String] = _inputData[0].components(separatedBy: .newlines)
        var ranges:[[Int]] = []

        for r: String in lines {
            ranges.append(r.split(separator: "-").map({Int($0)!}))
        }

        _ranges = ranges.sorted(by: {
            $0.first! < $1.first!
        })
    }
}
