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

                    for c in -1...partLength {
                        neighbors.append(inputMatrix[i-1][j-partLength+c]) // Top
                        neighbors.append(inputMatrix[i+1][j-partLength+c]) // Bottom
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
        let inputMatrix:[[Character]] = enterMatrix(_inputData)
        let pointMatrix = pointMatrix(inputMatrix)
        let rowLength:Int = inputMatrix[0].count - 1
        let neighbors:[Int] = [-1, 0, 1]
        var gearNumbers:Set<Int> = []
        var total:Int = 0

        for i in 1...inputMatrix.count-2 {

            for j in 0...rowLength {
            
                if(inputMatrix[i][j] != "*") {
                    continue
                }

                for n in neighbors {
                    gearNumbers.insert(pointMatrix[i-1][j+n])
                    gearNumbers.insert(pointMatrix[i][j+n])
                    gearNumbers.insert(pointMatrix[i+1][j+n])
                }

                if(gearNumbers.count == 3) {                
                    total += gearNumbers.reduce(1) {$0*$1}
                }

                gearNumbers = []
            }
        }

        print("Day 02, Part 2: \(total)")
    }

    func enterMatrix(_ lines:[String]) -> [[Character]]
    {
        var stringMatrix:[[Character]] = [[Character]]()
        let buffer:[Character] = Array(repeating: ".", count: lines[0].count+2)

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

    func pointMatrix(_ matrix:[[Character]]) -> [[Int]]
    {
        let rowCount = matrix.count - 1
        let colCount = matrix[0].count - 1

        var coords:[[Int]] = [[Int]]()
        for row in 0...rowCount {
            var rowNumbers:[Int] = Array(repeating: 1, count: colCount+1)
            var tracker:String = ""

            for col in 0...colCount {
                if(matrix[row][col].isNumber) {
                    tracker.append(matrix[row][col])
                } else if(tracker.count > 0) {
                    for c in 1...tracker.count {
                        rowNumbers[col - c] = Int(tracker)!
                    }

                    tracker = ""
                }
            }

            coords.append(rowNumbers)
        }

        return coords
    }
}
