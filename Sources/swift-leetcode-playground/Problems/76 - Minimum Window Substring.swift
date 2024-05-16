//
// Minimum Window Substring
//
// Difficulty: Hard
// https://leetcode.com/problems/minimum-window-substring
//

struct MinimumWindowSubstring {
    func input(_ s: String, _ t: String) -> String {
        
        guard !t.isEmpty else { return "" }
        
        let tc = t.unicodeScalars.reduce(into: [:]) { $0[$1, default: 0] += 1 }
        var window: [Unicode.Scalar: Int] = [:]
        
        let s = Array(s.unicodeScalars)
        
        var l = 0
        var r = 0
        var t = Int.max
        
        var have = 0
        let need = tc.keys.count
        
        for (i, c) in s.enumerated() {
            
            window[c, default: 0] += 1
            
            if let cc = tc[c], window[c] == cc {
                have += 1
            }
            
            while have == need {
                if (r - l + 1) < t {
                    r = i
                    t = r - l + 1
                }
                
                window[s[l]]! -= 1
                
                if let cc = tc[s[l]], window[s[l]]! < cc {
                    have -= 1
                }
                
                l += 1
            }
        }
        
        guard t < Int.max else { return "" }
        
        let a = Array(s[l ... r])
            .map(Character.init)
        
        return String(a)
    }
}

extension MinimumWindowSubstring: Testable {

    var problemTitle: String {
        "76 - Minimum Window Substring.swift"
    }

    func test() {
        testCase(expected: "BANC", with: input("ADOBECODEBANC", "ABC"))
        testCase(expected: "a", with: input("a", "a"))
        testCase(expected: "", with: input("a", "aa"))
    }
}
