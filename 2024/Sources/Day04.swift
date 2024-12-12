import Foundation

#if os(Linux)
    import Glibc
#endif

public class Day04: NSObject {

    let _inputPath: String
    let _inputData: [String]

    override init() {
        _inputPath = "../inputs/Day04.txt"
        //_inputPath = "../inputs/Day04-Test.txt"
        _inputData = try! String(contentsOfFile: _inputPath).trimmingCharacters(in: .newlines)
            .components(separatedBy: .newlines)

        super.init()
    }

    func Part1() {
        var total: Int = 0
        let grid: [[Substring]] = makeGrid()
        let rBound: Int = grid.count - 1
        let cBound: Int = grid[0].count - 1

        for r in 0...rBound {
            var across: String = ""
            var down: String = ""
            var slash: String = ""
            var backSlash: String = ""

            for c in 0...cBound {
                if r < grid.count - 3 {
                    down = "\(grid[r][c])\(grid[r + 1][c])\(grid[r + 2][c])\(grid[r + 3][c])"
                    total += xmasTest(down)
                }

                if c < grid.count - 3 {
                    across = "\(grid[r][c])\(grid[r][c + 1])\(grid[r][c + 2])\(grid[r][c + 3])"
                    total += xmasTest(across)
                }

                if r < grid.count - 3 && c < grid.count - 3 {
                    backSlash =
                        "\(grid[r][c])\(grid[r + 1][c + 1])\(grid[r + 2][c + 2])\(grid[r + 3][c + 3])"
                    total += xmasTest(backSlash)

                    slash =
                        "\(grid[r + 3][c])\(grid[r + 2][c + 1])\(grid[r + 1][c + 2])\(grid[r][c + 3])"
                    total += xmasTest(slash)
                }
            }
        }

        print("Day 04, Part 1: \(total)")
    }

    func Part2() {
        var total: Int = 0
        let grid: [[Substring]] = makeGrid()
        let rBound: Int = grid.count - 2
        let cBound: Int = grid[0].count - 2

        for r in 1...rBound {
            var backSlash: String = ""
            var slash: String = ""

            for c in 1...cBound {
                backSlash = "\(grid[r-1][c-1])\(grid[r][c])\(grid[r+1][c+1])"
                slash = "\(grid[r+1][c-1])\(grid[r][c])\(grid[r-1][c+1])"
                total += crossTest(left: backSlash, right: slash)
            }
        }

        print("Day 04, Part 2: \(total)")
    }

    func makeGrid() -> [[Substring]] {
        var grid: [[Substring]] = [[Substring]]()

        for line in _inputData {
            let parts = line.split(separator: "")
            grid.append(parts)
        }

        return grid
    }

    func xmasTest(_ found: String) -> Int {
        let xmas: String = "XMAS"
        let test1 = found
        let test2 = String(test1.reversed())

        if test1 == xmas || test2 == xmas {
            return 1
        }

        return 0
    }

    func crossTest(left: String, right: String) -> Int {
        let xmas: String = "MAS"
        let test1 = left
        let test2 = String(test1.reversed())
        let test3 = right
        let test4 = String(test3.reversed())

        if (test1 == xmas || test2 == xmas) && (test3 == xmas || test4 == xmas) {
            return 1
        }

        return 0
    }
}
