//
// Decoded String at Index
//
// Difficulty: Medium
// https://leetcode.com/problems/decoded-string-at-index
//

struct DecodedStringatIndex {
    func input(_ s: String, _ k: Int) -> String {
        
        var k = k
        var count = s.reduce(into: 0) { r, c in
            if let n = c.wholeNumberValue {
                r *= n
            } else {
                r += 1
            }
        }
        
        for c in s.reversed() {
            
            k %= count
            
            if let n = c.wholeNumberValue {
                count /= n
            } else {
                
                if k == 0 {
                    return String(c)
                }
                
                count -= 1
            }
        }
        
        return ""
    }
}

extension DecodedStringatIndex: Testable {

    var problemTitle: String {
        "880 - Decoded String at Index.swift"
    }

    func test() {
        testCase(expected: "o", with: input("leet2code3", 10))
        testCase(expected: "h", with: input("ha22", 5))
        testCase(expected: "a", with: input("a2345678999999999999999", 1))
    }
}
