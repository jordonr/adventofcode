import Foundation
#if os(Linux)
import Glibc
#endif

// 12 red cubes, 13 green cubes, and 14 blue cubes

public class Day02: NSObject {

    let _inputPath:String

    override init() {
        _inputPath = "../inputs/Day02.txt"

        super.init()
    }

    func Part1() {
        let inputLines:[String] = try! String(contentsOfFile: _inputPath).trimmingCharacters(in: .newlines).components(separatedBy: .newlines)
        var total:Int = 0
        let cubeMax:[String:Int] = ["red": 12, "green": 13, "blue": 14]

        for line in inputLines {
            let gameCubes:[String] = line.components(separatedBy: ":")
            let gameNumber:Int = Int(gameCubes[0].filter { "0123456789".contains($0) }) ?? 0
            var goodGame:Bool = true

            let regexCubes = try! Regex("(\\d+)\\s(\\w+)")
            let cubeSets:[String] = line.ranges(of: regexCubes).map { line[$0].trimmingCharacters(in: .whitespaces) }

            for cs in cubeSets {
                let parts = cs.components(separatedBy: " ")

                if(cubeMax[parts[1]]! < Int(parts[0])!) {
                    goodGame = false
                    break
                }
            }

            if(goodGame) {
                total += gameNumber
            }
        }

        print("Day 02, Part 1: \(total)")
    }

    func Part2() {
        let inputLines:[String] = try! String(contentsOfFile: _inputPath).trimmingCharacters(in: .newlines).components(separatedBy: .newlines)
        var total:Int = 0

        for line in inputLines {
            var cubeMin:[String:Int] = [String:Int]()
            let regexCubes = try! Regex("(\\d+)\\s(\\w+)")
            let cubeSets:[String] = line.ranges(of: regexCubes).map { line[$0].trimmingCharacters(in: .whitespaces) }

            for cs in cubeSets {
                let parts = cs.components(separatedBy: " ")
                let colorValue:Int = Int(parts[0])!

                if(cubeMin[parts[1]] ?? -1 < colorValue) {
                    cubeMin[parts[1]] = colorValue
                }
            }

            total += cubeMin["red"]! * cubeMin["blue"]! * cubeMin["green"]!
        }

        print("Day 02, Part 2: \(total)")
    }

}
