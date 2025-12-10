import Foundation

#if os(Linux)
    import Glibc
#endif

public class Day06: NSObject {

    let _inputPath: String
    let _inputData: [String]
    var _numbers: [[Int]]
    var _operators: [String]

    override init() {
        _inputPath = "../inputs/Day06.txt"
        // _inputPath = "../inputs/Day06-Test.txt"
        _inputData = try! String(contentsOfFile: _inputPath, encoding: .ascii ).trimmingCharacters(in: .newlines)
            .components(separatedBy: .newlines)
        _numbers = []
        _operators = []

        super.init()

        parseInput()
    }

    func Part1() {
        var tally: Int = 0

        for o in 0..._operators.count - 1 {
            var total:Int = (_operators[o] == "*" ? 1 : 0)
            for n in 0..._numbers.count - 1 {
                if(_operators[o] == "*") {
                    total = total * _numbers[n][o]
                } else if(_operators[o] == "+") {
                    total = total + _numbers[n][o]
                }
            }

            tally = tally + total
        }


        print("Day 05, Part 1: \(tally)")
    }

    func parseInput() {

        for i: Int in 0..._inputData.count - 2 {
            _numbers.append(_inputData[i].split(separator: " ").map({Int($0)!}))
        }

        _operators = _inputData.last!.split(separator: " ").map({String($0)})
    }
}
