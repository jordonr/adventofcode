import Foundation

#if os(Linux)
    import Glibc
#endif

public class Day07: NSObject {

    let _inputPath: String
    let _inputData: [String]

    override init() {
        _inputPath = "../inputs/Day07.txt"
        //_inputPath = "../inputs/Day07-Test.txt"
        _inputData = try! String(contentsOfFile: _inputPath).trimmingCharacters(in: .newlines)
            .components(separatedBy: .newlines)

        super.init()
    }

    func Part1() {
        var total: Int = 0

        for line in _inputData {
            let parts: [Substring] = line.split(separator: ":")
            let answer: Int = Int(parts[0])!
            let numbs: [Int] = parts[1].split(separator: " ").map { Int($0)! }
            var bins: [Int] = [Int](repeating: 0, count: numbs.count - 1)
            var sumBins: Int = 0

            while sumBins < bins.count {
                var temp: Int = numbs[0]

                for j in 0...bins.count - 1 {
                    if bins[j] == 0 {
                        temp += numbs[j + 1]
                    } else if bins[j] == 1 {
                        temp *= numbs[j + 1]
                    }
                }

                if temp == answer {
                    total += answer
                    break
                }

                sumBins = bins.reduce(
                    0,
                    { x, y in
                        x + y
                    })

                if sumBins < bins.count {
                    bins = addBin(bins, 0)
                }

            }
        }

        print("Day 07, Part 1: \(total)")
    }

    func Part2() {
        var total: Int = 0

        for line in _inputData {
            let parts: [Substring] = line.split(separator: ":")
            let answer: Int = Int(parts[0])!
            let numbs: [Int] = parts[1].split(separator: " ").map { Int($0)! }
            var terns: [Int] = [Int](repeating: 0, count: numbs.count - 1)
            let maxTerns = terns.count * 2
            var sumTerns: Int = 0

            while sumTerns < maxTerns {
                var temp: Int = numbs[0]

                for j in 0...terns.count - 1 {
                    if terns[j] == 0 {
                        temp += numbs[j + 1]
                    } else if terns[j] == 1 {
                        temp *= numbs[j + 1]
                    } else if terns[j] == 2 {
                        temp = Int("\(temp)\(numbs[j + 1])")!
                    }
                }

                if temp == answer {
                    total += answer
                    break
                }

                sumTerns = terns.reduce(
                    0,
                    { x, y in
                        x + y
                    })

                if sumTerns < maxTerns {
                    terns = addTern(terns, 0)
                }

            }
        }

        // Too Low:    1053299670673
        // Too High: 543952363811852
        print("Day 07, Part 2: \(total)")
    }

    func addBin(_ bins: [Int], _ index: Int) -> [Int] {
        var binTemp = bins
        let tempIndex = index
        binTemp[tempIndex] += 1

        if binTemp[tempIndex] == 2 {
            binTemp[tempIndex] = 0
            return addBin(binTemp, tempIndex + 1)
        }

        return binTemp
    }

    func addTern(_ tern: [Int], _ index: Int) -> [Int] {
        var ternTemp = tern
        let tempIndex = index
        ternTemp[tempIndex] += 1

        if ternTemp[tempIndex] == 3 {
            ternTemp[tempIndex] = 0
            return addTern(ternTemp, tempIndex + 1)
        }

        return ternTemp
    }

}
