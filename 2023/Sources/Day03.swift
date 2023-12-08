import Foundation
import Glibc 


public class Day03: NSObject 
{

    let _inputPath:String
    let _inputData:[String]

    override init() 
    {
        _inputPath = "../inputs/Day03.txt"
        _inputData = try! String(contentsOfFile: _inputPath).trimmingCharacters(in: .newlines).components(separatedBy: .newlines)
        super.init()
    }

    func Part1() 
    {
        let inputMatrix:[[Character]] = enterMatrix(_inputData)
        var total:Int = 0

        for i in 1...inputMatrix.count-2 {
            var partNumber:String = ""

            for j in 0...inputMatrix[i].count-1 {
            
                if(inputMatrix[i][j].isNumber) {
                    partNumber.append(inputMatrix[i][j])
                } else if(partNumber.count > 0) {
                    let partLength:Int = partNumber.count
                    var neighbors:String = ""

                    neighbors.append(inputMatrix[i][j-partLength-1]) // Left
                    neighbors.append(inputMatrix[i][j]) // Right

                    for c in 0...partLength+1 {
                        neighbors.append(inputMatrix[i-1][j-partLength-1+c]) // Top
                        neighbors.append(inputMatrix[i+1][j-partLength-1+c]) // Bottom
                    }
                  
                    let markers:String = neighbors.replacingOccurrences(of: ".", with: "")
                    if(markers.count > 0) {
                        total += Int(partNumber)!
                    }                  
                    partNumber = ""
                }
            }
        }

        print("Day 02, Part 1: \(total)")
    }

    func Part2() 
    {
        // let inputLines:[String] = _inputData
        // var total:Int = 0

        // for l in 0...inputLines.count-1 {
            
        //     print(inputLines[l])
        //     print(inputLines[l].charAt(3))
        // }

        // print("Day 02, Part 2: \(total)")
    }

    func enterMatrix(_ lines:[String]) -> [[Character]]
    {
        var stringMatrix:[[Character]] = [[Character]]()
        var buffer:[Character] = [Character]()

        // Missing Perl's "."x10 right now
        for _ in 0...lines[0].count {
            buffer.append(".")
        }

        stringMatrix.append(buffer)

        for l in lines {
            var ll = Array(l)
            ll.insert(contentsOf: ".", at: 0)
            ll.append(".")
            stringMatrix.append(ll)
        }

        stringMatrix.append(buffer)

        return stringMatrix
    }
}
