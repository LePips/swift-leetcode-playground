//
// Valid Parenthesis String
//
// Difficulty: Medium
// https://leetcode.com/problems/valid-parenthesis-string
//

struct ValidParenthesisString {
    func input(_ s: String) -> Bool {
        var minO = 0
        var maxO = 0
        
        for c in s {
            switch c {
            case "(":
                minO += 1
                maxO += 1
            case ")":
                minO = max(minO - 1, 0)
                maxO -= 1
                
                if maxO < 0 {
                    return false
                }
            case "*":
                minO = max(minO - 1, 0)
                maxO += 1
            default:
                fatalError()
            }
        }
        
        return minO == 0
    }
}

extension ValidParenthesisString: Testable {

    var problemTitle: String {
        "678 - Valid Parenthesis String.swift"
    }

    func test() {
        testCase(expected: true, with: input("()"))
        testCase(expected: true, with: input("(*)"))
        testCase(expected: true, with: input("(*))"))
        testCase(expected: false, with: input("("))
        testCase(expected: false, with: input("(((((*(()((((*((**(((()()*)()()()*((((**)())*)*)))))))(())(()))())((*()()(((()((()*(())*(()**)()(())"))
        testCase(expected: true, with: input("((((()(()()()*()(((((*)()*(**(())))))(())()())(((())())())))))))(((((())*)))()))(()((*()*(*)))(*)()"))
        testCase(expected: false, with: input("()("))
    }
}
