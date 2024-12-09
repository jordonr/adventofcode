import Foundation

#if os(Linux)
    import Glibc
#endif

public class Day05: NSObject {
    let _inputPath: String
    let _inputData: [String]
    var _almanac: [String: [[String: ClosedRange<Int>]]]
    let _mapKeys: [String]

    override init() {
        _inputPath = "../inputs/Day05.txt"
        _inputData = try! String(contentsOfFile: _inputPath).trimmingCharacters(in: .newlines)
            .components(separatedBy: .newlines)
        _almanac = [:]
        _mapKeys = [
            "seed-to-soil",
            "soil-to-fertilizer",
            "fertilizer-to-water",
            "water-to-light",
            "light-to-temperature",
            "temperature-to-humidity",
            "humidity-to-location",
        ]

        super.init()
    }

    func Part1() {
        var seeds: [Int] = _inputData[0].matchesByRegex(for: "\\d+").map { Int($0)! }

        for s in 0...seeds.count - 1 {
            var skipToNext: Bool = false

            for l in 2..._inputData.count - 1 {
                let line: String = _inputData[l]

                if line.count == 0 {
                    skipToNext = false
                    continue
                } else if !line.charAt(0).isNumber || skipToNext {
                    continue
                }

                let numbers = line.matchesByRegex(for: "\\d+").map { Int($0)! }
                let destRange = numbers[0]...(numbers[0] + numbers[2] - 1)
                let sourceRange = numbers[1]...(numbers[1] + numbers[2] - 1)

                if sourceRange.contains(seeds[s]) {
                    seeds[s] = (seeds[s] - sourceRange.first!) + destRange.first!
                    skipToNext = true
                }
            }
        }

        print("Day 05, Part 1: \(seeds.min()!)")
    }

    func Part2() {
        var seed: Int = -1
        var location: Int = -1
        let seedList: [Int] = _inputData[0].matchesByRegex(for: "\\d+").map { Int($0)! }
        var seedRanges: [ClosedRange<Int>] = []

        var count = 0
        while count < seedList.count {
            let upper: Int = seedList[count] + seedList[count + 1] - 1
            seedRanges.append(seedList[count]...upper)
            count += 2
        }

        mapAlmanac()

        var found: Bool = false
        var backwardKeys: [String] = _mapKeys
        backwardKeys.reverse()
        for s in 0...Int.max {
            seed = s
            for b in backwardKeys {
                for r in _almanac[b]! {
                    if r["destination"]!.contains(seed) {
                        seed = (seed - r["destination"]!.first!) + r["source"]!.first!
                        break
                    }
                }
            }

            for sr in seedRanges {
                if sr.contains(seed) {
                    location = s
                    found = true
                }
            }

            if found {
                break
            }
        }

        print("Day 05, Part 2: \(location)")
    }

    func mapAlmanac() {
        var key: String = ""

        for l in 2..._inputData.count - 1 {
            let line: String = _inputData[l]

            if line.count == 0 {
                continue
            } else if !line.charAt(0).isNumber {
                key = line.matchesByRegex(for: "^\\w+-to-\\w+").first!
                _almanac.updateValue([], forKey: key)
                continue
            }

            let numbers = line.matchesByRegex(for: "\\d+").map { Int($0)! }
            let destRange = numbers[0]...(numbers[0] + numbers[2] - 1)
            let sourceRange = numbers[1]...(numbers[1] + numbers[2] - 1)

            _almanac[key]?.append(["source": sourceRange, "destination": destRange])
        }
    }
}
