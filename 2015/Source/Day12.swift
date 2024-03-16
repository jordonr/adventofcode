import Foundation

#if os(Linux)
import Glibc
#endif

let day = Day12()

day.Part2()

public class Day12: NSObject {
  let _inputPath: String
  let _inputData: Data

  override init() {
    _inputPath = "../inputs/Day12.txt"
    _inputData =  try! String(contentsOfFile: _inputPath).data(using: .utf8)!

    super.init()
  }

  func Part2() {
    var total: Int = 0

    let parsedJson = try! JSONSerialization.jsonObject(with: _inputData, options: []) as! AnyObject

    total = sumJson(parsedJson)

    print("Day 09, Part 2: \(total)")
  }

func sumJson(_ obj: AnyObject) -> Int {
    if let num = obj as? Int {
        return num
    }
    if let _ =  obj as? String {
        return 0
    }
    if let arr = obj as? NSArray {
        var arr_total = 0
        for arr_i in 0..<arr.count {
            arr_total += sumJson(arr[arr_i] as! AnyObject)
        }
        return arr_total
    }
    if let dict = obj as? NSDictionary {
        if dict.allValues.contains { ($0 as? String) == "red" } { return 0 }
        var dict_total = 0
        for v in dict.allValues {
            dict_total += sumJson(v as! AnyObject)
        }
        return dict_total
    }

    return 0
}
}
