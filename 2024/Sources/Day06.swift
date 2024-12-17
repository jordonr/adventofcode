import Foundation

#if os(Linux)
    import Glibc
#endif

public class Day06: NSObject {

    let _inputPath: String
    let _inputData: [String]
    var _firstRun: [String: Direction]

    override init() {
        _inputPath = "../inputs/Day06.txt"
        //_inputPath = "../inputs/Day06-Test.txt"
        _inputData = try! String(contentsOfFile: _inputPath).trimmingCharacters(in: .newlines)
            .components(separatedBy: .newlines)
        _firstRun = [:]

        super.init()
    }

    func Part1() {
        let baseMap: [[Substring]] = makeGrid()
        let lb: Labguard = Labguard(map: baseMap)

        lb.setPosition(pos: findStart(map: baseMap))
        _ = lb.move()
        _firstRun = lb._coverage

        print("Day 06, Part 1: \(lb._coverage.count)")
    }

    func Part2() {
        var total: Int = 0
        let baseMap: [[Substring]] = makeGrid()
        let position: [Int] = findStart(map: baseMap)

        _firstRun["\(position[0])|\(position[0])"] = nil

        for (key, _) in _firstRun {
            let coords: [Int] = key.split(separator: "|").map { Int($0)! }

            var map = baseMap
            map[coords[0]][coords[1]] = "O"

            //print(baseMap[coords[0]])
            //print(map[coords[0]])

            let lb: Labguard = Labguard(map: map)
            lb.setPosition(pos: position)

            let t: Bool = lb.move()
            //print(t)
            if !t {
                total += 1
            }
        }

        // To Hight: 5370
        // To Low: 1585
        print("Day 06, Part 2: \(total)")
    }

    func makeGrid() -> [[Substring]] {
        var grid: [[Substring]] = [[Substring]]()

        for line in _inputData {
            let parts = line.split(separator: "")
            grid.append(parts)
        }

        return grid
    }

    func findStart(map: [[Substring]]) -> [Int] {
        for r in 0...map.count - 1 {
            for c in 0...map[r].count - 1 {
                if map[r][c] == "^" {
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
        var _steps: Int
        var _direction: Direction
        var _posX: Int
        var _posY: Int
        var _coverage: [String: Direction]
        var _tracer: [String: Int]
        var _baseMap: [[Substring]]

        init(map: [[Substring]]) {
            _steps = 0
            _direction = Direction.UP
            _posX = 0
            _posY = 0
            _coverage = [:]
            _tracer = [:]
            _baseMap = map
        }

        func setPosition(pos: [Int]) {
            _posX = pos[0]
            _posY = pos[1]
            _coverage["\(self._posX)|\(self._posY)"] = _direction
        }

        func move() -> Bool {
            let next = nextBlock()

            if next == "#" || next == "O" {
                turn()
                return self.move()
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

                if _tracer["\(self._posX)|\(self._posY)|\(_direction)"] == 1 {
                    return false
                } else {
                    _tracer["\(self._posX)|\(self._posY)|\(_direction)"] = 1
                }

                _coverage["\(self._posX)|\(self._posY)"] = _direction

                return self.move()
            }

            return true
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

            if x >= 0 && y >= 0 && x < _baseMap.count
                && y < _baseMap[0].count
            {
                return _baseMap[x][y]
            }

            return ""
        }
    }
}
