//
// Score of a String
//
// Difficulty: Easy
// https://leetcode.com/problems/score-of-a-string
//

struct ScoreofaString {
    func input(_ s: String) -> Int {
		var t = 0
        let s = Array(s)
        
        for i in 0 ..< s.count - 1 {
            let d = abs(Int(s[i].asciiValue!) - Int(s[i + 1].asciiValue!))
            t += d
        }
        
        return t
    }
}

extension ScoreofaString: Testable {

    var problemTitle: String {
        "3110 - Score of a String.swift"
    }

    func test() {
        testCase(expected: 13, with: input("hello"))
        testCase(expected: 50, with: input("zaz"))
    }
}
