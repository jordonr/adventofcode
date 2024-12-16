import Foundation

#if os(Linux)
    import Glibc
#endif

public class Day06: NSObject {

    let _inputPath: String
    let _inputData: [String]
    var _baseMap: [[Substring]]

    override init() {
        _inputPath = "../inputs/Day06.txt"
        //_inputPath = "../inputs/Day06-Test.txt"
        _inputData = try! String(contentsOfFile: _inputPath).trimmingCharacters(in: .newlines)
            .components(separatedBy: .newlines)
        _baseMap = [[]]

        super.init()
    }

    func Part1() {
        _baseMap = makeGrid()
        let lb: Labguard = Labguard(parent: self)

        lb.setPosition(pos: findStart())
        lb.move()

        print("Day 06, Part 1: \(lb._coverage.count)")
    }

    func Part2() {
        //var total: Int = 0

        //print("Day 06, Part 2: \(total)")
    }

    func makeGrid() -> [[Substring]] {
        var grid: [[Substring]] = [[Substring]]()

        for line in _inputData {
            let parts = line.split(separator: "")
            grid.append(parts)
        }

        return grid
    }

    func findStart() -> [Int] {
        for r in 0..._baseMap.count - 1 {
            for c in 0..._baseMap[r].count - 1 {
                if _baseMap[r][c] == "^" {
                    return [r, c]
                }
            }
        }

        return [0, 0]
    }

    enum Direction {
        case UP
        case DOWN
        case LEFT
        case RIGHT
    }

    class Labguard {
        unowned let parent: Day06
        var _steps: Int
        var _direction: Direction
        var _posX: Int
        var _posY: Int
        var _coverage: [String: Int]

        init(parent: Day06) {
            _steps = 0
            _direction = Direction.UP
            _posX = 0
            _posY = 0
            _coverage = [:]

            self.parent = parent
        }

        func setPosition(pos: [Int]) {
            _posX = pos[0]
            _posY = pos[1]
            _coverage["\(self._posX)|\(self._posY)"] = 1
        }

        func move() {
            let next = nextBlock()

            if next == "#" {
                turn()
            }

            switch self._direction {
            case Direction.UP:
                self._posX += -1

            case Direction.DOWN:
                self._posX += 1

            case Direction.LEFT:
                self._posY += -1

            case Direction.RIGHT:
                self._posY += 1
            }

            if next.count > 0 {
                _steps += 1
                _coverage["\(self._posX)|\(self._posY)"] = 1
                self.move()
            }
        }

        func turn() {
            switch self._direction {
            case Direction.UP:
                self._direction = Direction.RIGHT

            case Direction.DOWN:
                self._direction = Direction.LEFT

            case Direction.LEFT:
                self._direction = Direction.UP

            case Direction.RIGHT:
                self._direction = Direction.DOWN

            }
        }

        func nextBlock() -> Substring {
            var x = self._posX
            var y = self._posY

            switch self._direction {
            case Direction.UP:
                x += -1

            case Direction.DOWN:
                x += 1

            case Direction.LEFT:
                y += -1

            case Direction.RIGHT:
                y += 1
            }

            if x >= 0 && y >= 0 && x < parent._baseMap.count
                && y < parent._baseMap[0].count
            {
                return parent._baseMap[x][y]
            }

            return ""
        }
    }
}
