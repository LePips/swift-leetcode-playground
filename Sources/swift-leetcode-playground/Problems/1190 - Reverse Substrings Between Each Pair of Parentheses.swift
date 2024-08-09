//
// Reverse Substrings Between Each Pair of Parentheses
//
// Difficulty: Medium
// https://leetcode.com/problems/reverse-substrings-between-each-pair-of-parentheses
//

struct ReverseSubstringsBetweenEachPairofParentheses {
    
    func f(_ s: Substring) -> (String, String.Index) {
        
        var c = ""
        
        var i = s.startIndex
        
        w: while i < s.endIndex {
            switch s[i] {
            case "(":
                let j = f(s[s.index(after: i)...])
                i = j.1
                c += String(j.0.reversed())
            case ")":
                break w
            default:
                c += String(s[i])
                i = s.index(i, offsetBy: 1)
            }
        }
        
        let j = i != s.endIndex ? s.index(after: i) : i
        
        return (c, j)
    }
    
    func input(_ s: String) -> String {
        f(s[s.startIndex...]).0
    }
}

extension ReverseSubstringsBetweenEachPairofParentheses: Testable {

    var problemTitle: String {
        "1190 - Reverse Substrings Between Each Pair of Parentheses.swift"
    }

    func test() {
        testCase(expected: "dcba", with: input("(abcd)"))
        testCase(expected: "iloveu", with: input("(u(love)i)"))
        testCase(expected: "leetcode", with: input("(ed(et(oc))el)"))
        testCase(expected: "apmnolkjihgfedcbq", with: input("a(bcdefghijkl(mno)p)q"))
    }
}
