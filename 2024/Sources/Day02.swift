import Foundation

#if os(Linux)
    import Glibc
#endif

public class Day02: NSObject {

    let _inputPath: String
    let _inputData: [String]

    override init() {
        _inputPath = "../inputs/Day02.txt"
        //_inputPath = "../inputs/Day02-Test.txt"
        _inputData = try! String(contentsOfFile: _inputPath).trimmingCharacters(in: .newlines)
            .components(separatedBy: .newlines)

        super.init()
    }

    func Part1() {
        var total: Int = 0

        for line in _inputData {
            let parts: [Int] = line.split(separator: " ").map({ Int($0)! })
            var safe: Bool = false

            safe = isSafe(parts: parts)

            if safe {
                total += 1
            }
        }

        print("Day 02, Part 1: \(total)")
    }

    func Part2() {
        var total: Int = 0

        for line in _inputData {
            let parts: [Int] = line.split(separator: " ").map({ Int($0)! })
            var safe: Bool = false

            for p in 1...parts.count {
                let dampened: [Int] = Array(parts[0..<(p - 1)]) + Array(parts[p...])
                safe = isSafe(parts: dampened)

                if safe {
                    total += 1
                    break
                }
            }
        }

        print("Day 02, Part 2: \(total)")
    }

    func isSafe(parts: [Int]) -> Bool {
        var safe: Bool = true
        for i in 1...parts.count - 2 {
            let diffBack: Int = parts[i - 1] - parts[i]
            let diffForward: Int = parts[i + 1] - parts[i]
            let partSet = Set(parts.map { $0 })

            if abs(diffBack) > 3 || abs(diffForward) > 3 {
                safe = false
                break
            } else if partSet.count != parts.count {
                safe = false
                break
            } else if (parts[i - 1] > parts[i]) != (parts[i] > parts[i + 1]) {
                safe = false
                break
            }
        }

        return safe
    }
}
