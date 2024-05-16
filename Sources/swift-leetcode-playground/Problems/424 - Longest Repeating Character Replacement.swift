//
// Longest Repeating Character Replacement
//
// Difficulty: Medium
// https://leetcode.com/problems/longest-repeating-character-replacement
//

struct LongestRepeatingCharacterReplacement {
    func input(_ s: String, _ k: Int) -> Int {
        
        var d: [UInt16: Int] = [:]
		var r = 0
        var l = 0
        var m = 0
        
        let s = ArraySlice(s.utf16)
        
        for c in s.enumerated() {
            
            r = c.offset
            
            d[c.element, default: 0] += 1
            m = max(m, d[c.element]!)
            
            if (r - l + 1) - m > k {
                d[s[l], default: 0] -= 1
                l += 1
            }
        }
        
        return r - l + 1
    }
}

extension LongestRepeatingCharacterReplacement: Testable {

    var problemTitle: String {
        "424 - Longest Repeating Character Replacement.swift"
    }

    func test() {
        testCase(expected: 4, with: input("ABAB", 2))
        testCase(expected: 4, with: input("AABABBA", 1))
    }
}
