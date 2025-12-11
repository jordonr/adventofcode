import Foundation

#if os(Linux)
    import Glibc
#endif

public class Day07: NSObject {

    let _inputPath: String
    let _inputData: [String]
    var _christmasTree: [[String]]
    var _star: [Int]
    var _cache: [String: Int]

    override init() {
        _inputPath = "../inputs/Day07.txt"
        // _inputPath = "../inputs/Day07-Test.txt"
        _inputData = try! String(contentsOfFile: _inputPath, encoding: .ascii ).trimmingCharacters(in: .newlines)
            .components(separatedBy: .newlines)
        _christmasTree = []
        _star = []
        _cache = [:]

        super.init()
    }

    func Part1() {
        var tally: Int = 0

        _christmasTree.append(_inputData.first!.map({String($0)}))
        for i: Int in 1..._inputData.count - 1 {
            _christmasTree.append(_inputData[i].map({String($0)}))

            for l in 0..._christmasTree[i].count - 1 {
                let current = _christmasTree[i][l]
                let above = _christmasTree[i-1][l]

                if above == "S" {
                    _star = [i-1, l]
                    _christmasTree[i][l] = "|"
                } else if above == "|" && current == "^" {
                    tally = tally + 1
                    _christmasTree[i][l-1] = "|"
                    _christmasTree[i][l+1] = "|"
                } else if above == "|" {
                    _christmasTree[i][l] = "|"
                }
            }
        }

        print("Day 07, Part 1: \(tally)")
    }

    func Part2() {
        var tally: Int = 0

        tally = solveBeam(_star)

        // To Low: 3137
        print("Day 07, Part 2: \(tally)")
    }

    func solveBeam(_ point:[Int]) -> Int {
        let hash = String(format: "%d,%d", point[0], point[1])

        if let cache = _cache[hash] {
            return cache
        }

        if point[0] >= _christmasTree[0].count {
            return 1
        }

        if _christmasTree[point[0]][point[1]] != "^" {
            let cache = solveBeam([point[0] + 1, point[1]])
            _cache[hash] = cache
            return cache
        } else if _christmasTree[point[0]][point[1]] == "^" {
            return solveBeam([point[0], point[1] - 1]) + solveBeam([point[0], point[1] + 1])
        }

        return 0
    }
}
