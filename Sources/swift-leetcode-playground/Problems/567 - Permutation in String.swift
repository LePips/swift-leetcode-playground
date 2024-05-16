//
// Permutation in String
//
// Difficulty: Medium
// https://leetcode.com/problems/permutation-in-string
//

struct PermutationinString {
    
    func input(_ s1: String, _ s2: String) -> Bool {
        
        guard s1.count <= s2.count else { return false }
        let l1 = s1.count
        
        let s1c: [UInt16: Int] = s1.utf16.reduce(into: [:]) { $0[$1, default: 0] += 1 }
        
        let s = ArraySlice(s2.utf16)
        var d: [UInt16: Int] = s[0 ..< l1].reduce(into: [:]) { $0[$1, default: 0] += 1 }
        
        for i in l1 ..< s2.count {
            
            if d == s1c {
                return true
            }
            
            d[s[i], default: 0] += 1
            
            if let a = d[s[i - l1]] {
                if a <= 1 {
                    d[s[i - l1]] = nil
                } else {
                    d[s[i - l1], default: 0] -= 1
                }
            }
        }
        
        if d == s1c {
            return true
        }
        
		return false
    }
}

extension PermutationinString: Testable {

    var problemTitle: String {
        "567 - Permutation in String.swift"
    }

    func test() {
        testCase(expected: false, with: input("ab", "eidboaoo"))
        testCase(expected: true, with: input("ab", "eidbaooo"))
        testCase(expected: false, with: input("ab", "asdf"))
        testCase(expected: true, with: input("adc", "dcda"))
    }
}
