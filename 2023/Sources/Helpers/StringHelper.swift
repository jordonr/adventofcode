import Foundation

extension String {

    func charAt(_ loc:Int) -> Character
    {
        return self[self.index(self.startIndex, offsetBy: loc)]
    }

    func matchesByRegex(for regex:String) -> [String] 
    {
        do {
            let regex = try NSRegularExpression(pattern:regex)
            let results = regex.matches(in: self, range:NSRange(self.startIndex..., in:self))

            return results.map {
                String(self[Range($0.range, in: self)!])
            }
        } catch _ {
            return []
        }
    }
}