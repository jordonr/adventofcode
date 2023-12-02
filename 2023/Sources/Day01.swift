import Foundation
import Glibc 

public class Day01: NSObject {

    static func Part1() {
        let input:String = try! String(contentsOfFile: "../inputs/Day01.txt")
        let inputLines:[String] = input.trimmingCharacters(in: .newlines).components(separatedBy: .newlines)
        var total:Int = 0

        for line in inputLines {
            let myNums:String = String(line.filter { "0123456789".contains($0) })
            let parts:[Int] = myNums.split(separator: "").map({Int($0)!})
            
            total += (parts.first! * 10) + parts.last!
        }

        print("Day 01: \(total)")
    }

}




