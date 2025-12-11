import Foundation

#if os(Linux)
    import Glibc
#endif

public class Day07: NSObject {

    let _inputPath: String
    let _inputData: [String]

    override init() {
        _inputPath = "../inputs/Day07.txt"
        // _inputPath = "../inputs/Day07-Test.txt"
        _inputData = try! String(contentsOfFile: _inputPath, encoding: .ascii ).trimmingCharacters(in: .newlines)
            .components(separatedBy: .newlines)

        super.init()
    }

    func Part1() {
        var tally: Int = 0
        var line: [[String]] = []

        line.append(_inputData.first!.map({String($0)}))
        for i: Int in 1..._inputData.count - 2 {
            line.append(_inputData[i].map({String($0)}))

            for l in 0...line[i].count - 1 {
                let current = line[i][l]
                let above = line[i-1][l]

                if above == "S" {
                    line[i][l] = "|"
                } else if above == "|" && current == "^" {
                    tally = tally + 1
                    line[i][l-1] = "|"
                    line[i][l+1] = "|"
                } else if above == "|" {
                    line[i][l] = "|"
                }
            }
        }

        print("Day 07, Part 1: \(tally)")
    }

    func Part2() {
        var tally: Int = 0
        

        print("Day 07, Part 2: \(tally)")
    }
}
