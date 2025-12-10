import Foundation

#if os(Linux)
    import Glibc
#endif

public class Day06: NSObject {

    let _inputPath: String
    let _inputData: [String]
    var _numbers: [[Int]]
    var _operators: [String]
    var _cephalopod_numbers: [[[String]]]

    override init() {
        _inputPath = "../inputs/Day06.txt"
        // _inputPath = "../inputs/Day06-Test.txt"
        _inputData = try! String(contentsOfFile: _inputPath, encoding: .ascii ).trimmingCharacters(in: .newlines)
            .components(separatedBy: .newlines)

        _operators = _inputData.last!.split(separator: " ").map({String($0)})
        _numbers = []
        _cephalopod_numbers = []

        super.init()
    }

    func Part1() {
        var tally: Int = 0

        for i: Int in 0..._inputData.count - 2 {
            _numbers.append(_inputData[i].split(separator: " ").map({Int($0)!}))
        }

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

    func Part2() {
        var tally: Int = 0
        let operator_line: [String] = _inputData.last!.map({String($0)})
        var parse_code: [Int] = []

        for c in 0...operator_line.count - 1 {
            if operator_line[c] != " " {
                parse_code.append(c)
            }
        }

        for i: Int in 0..._inputData.count - 2 {
            var prev_indx = parse_code.first
            var line:[String] = []
            var line_str:[[String]] = []

            for pc in 1...parse_code.count - 1 {
                line = _inputData[i].map({String($0)})
                line_str.append(Array(line[prev_indx!..<parse_code[pc]]))

                prev_indx = parse_code[pc]
            }

            line.append(" ") // Last line needs a space to match others
            line_str.append(Array(line[prev_indx!..<line.count]))

            _cephalopod_numbers.append(line_str)
        }

        for o in 0..._operators.count - 1 {
            var total:Int = (_operators[o] == "*" ? 1 : 0)
            for n in 0..._cephalopod_numbers[0][o].count - 2 {
                let idx = _cephalopod_numbers[0][o].count - 2 - n
                var builder:[String] = []
                for l in 0..._cephalopod_numbers.count - 1 {
                    builder.append(_cephalopod_numbers[l][o][idx])
                }

                if(_operators[o] == "*") {
                    total = total * Int(builder.joined().trimmingCharacters(in: .whitespaces))!
                } else if(_operators[o] == "+") {
                    total = total + Int(builder.joined().trimmingCharacters(in: .whitespaces))!
                }
            }

            tally = tally + total
        }

        print("Day 05, Part 2: \(tally)")
    }
}
