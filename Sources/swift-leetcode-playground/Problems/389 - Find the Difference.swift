//
// Find the Difference
//
// Difficulty: Easy
// https://leetcode.com/problems/find-the-difference
//

struct FindtheDifference {
    
    func input(_ s: String, _ t: String) -> Character {
        let a = s.unicodeScalars.reduce(0) { $0 ^ $1.value }
        let b = t.unicodeScalars.reduce(0) { $0 ^ $1.value }
        
        return Character(UnicodeScalar(a ^ b)!)
    }
}

extension FindtheDifference: Testable {

    var problemTitle: String {
        "389 - Find the Difference.swift"
    }

    func test() {
        testCase(expected: "e", with: input("abcd", "abcde"))
        testCase(expected: "y", with: input("", "y"))
    }
}
