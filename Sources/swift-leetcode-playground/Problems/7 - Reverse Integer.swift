//
// Reverse Integer
//
// Difficulty: Medium
// https://leetcode.com/problems/reverse-integer
//

struct ReverseInteger {
    func input(_ x: Int) -> Int {
        var r = 0
        var x = x

        while x != 0 {
            if r > Int32.max / 10 || r < Int32.min / 10 {
                return 0
            }
            
            r = r * 10
            r = r + (x % 10)
            x /= 10
        }
        
        return r
    }
}

extension ReverseInteger: Testable {

    var problemTitle: String {
        "7 - Reverse Integer.swift"
    }

    func test() {
        testCase(expected: 321, with: input(123))
        testCase(expected: -123, with: input(-321))
        testCase(expected: 0, with: input(-2147483648))
    }
}
