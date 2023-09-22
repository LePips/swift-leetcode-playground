//
// Is Subsequence
//
// Difficulty: Easy
// https://leetcode.com/problems/is-subsequence
//

struct IsSubsequence {
    func input(_ s: String, _ t: String) -> Bool {
        
        guard !s.isEmpty else { return true }

        var s = s
        var i = s.removeFirst()
        
        for c in t {
            if c == i {
                if s.isEmpty {
                    return true
                }

                i = s.removeFirst()
            }
        }
        
        return false
    }
}

extension IsSubsequence: Testable {

    var problemTitle: String {
        "392 - Is Subsequence.swift"
    }

    func test() {
        testCase(expected: true, with: input("abc", "aasdbasc"))
        testCase(expected: false, with: input("axc", "asudhficx"))
        testCase(expected: false, with: input("acb", "ahbgdc"))
        testCase(expected: true, with: input("", "asbfajskdlfgashjdk"))
    }
}
