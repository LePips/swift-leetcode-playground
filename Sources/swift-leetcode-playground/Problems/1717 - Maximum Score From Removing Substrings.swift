//
// Maximum Score From Removing Substrings
//
// Difficulty: Medium
// https://leetcode.com/problems/maximum-score-from-removing-substrings
//

struct MaximumScoreFromRemovingSubstrings {
    
    func f(_ s: String, _ r: String) -> (String, Int) {
        
        let r = Array(r)
        var t = ""
        var tc = 0
        
        for c in s {
            if t.isEmpty {
                t.append(c)
            } else if t.last == r[0], c == r[1] {
                t.removeLast()
                tc += 1
            } else {
                t.append(c)
            }
        }
        
        return (t, tc)
    }
    
    func input(_ s: String, _ x: Int, _ y: Int) -> Int {
        
        var t = 0
        
        if x > y {
            let a = f(s, "ab")
            let b = f(a.0, "ba")
            
            t += a.1 * x
            t += b.1 * y
        } else {
            let a = f(s, "ba")
            let b = f(a.0, "ab")
            
            t += a.1 * y
            t += b.1 * x
        }
        
        return t
    }
}

extension MaximumScoreFromRemovingSubstrings: Testable {

    var problemTitle: String {
        "1717 - Maximum Score From Removing Substrings.swift"
    }

    func test() {
        testCase(expected: 19, with: input("cdbcbbaaabab", 4, 5))
        testCase(expected: 20, with: input("aabbaaxybbaabb", 5, 4))
    }
}
