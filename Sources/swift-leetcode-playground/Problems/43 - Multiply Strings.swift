//
// Multiply Strings
//
// Difficulty: Medium
// https://leetcode.com/problems/multiply-strings
//

struct MultiplyStrings {
    func input(_ num1: String, _ num2: String) -> String {
        
        var t = Array(repeating: 0, count: num1.count + num2.count)

        for (i, n1) in num1.enumerated().reversed() {
            for (j, n2) in num2.enumerated().reversed() {
                let d1 = n1.wholeNumberValue!
                let d2 = n2.wholeNumberValue!
                let p1 = i + j
                let p2 = i + j + 1
                let m = d1 * d2 + t[p2]
                
                t[p1] += m / 10
                t[p2] = m % 10
            }
        }
        
        while t.first == 0 {
            if t.count == 1 {
                break
            }
            t.removeFirst()
        }
        
        let f = t.map(String.init)
            .joined()
        
        return String(f)
    }
}

extension MultiplyStrings: Testable {

    var problemTitle: String {
        "43 - Multiply Strings.swift"
    }

    func test() {
        testCase(expected: "6", with: input("2", "3"))
        testCase(expected: "56088", with: input("123", "456"))
        testCase(expected: "0", with: input("0", "0"))
        testCase(expected: "0", with: input("0", "123"))
    }
}
