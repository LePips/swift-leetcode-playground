//
// Pow(x, n)
//
// Difficulty: Medium
// https://leetcode.com/problems/powx-n
//

struct Powxn {
    func input(_ x: Double, _ n: Int) -> Double {
        guard n != 0 else { return 1 }
        
        var s = n < 0
        var n = abs(n)
        var t: Double = 1
        
        while n != 0 {
            t *= x
            n -= 1
        }
        
        if s {
            return 1 / t
        } else {
            return t
        }
    }
}

extension Powxn: Testable {

    var problemTitle: String {
        "50 - Pow(x, n).swift"
    }

    func test() {
        testCase(expected: 1024, with: input(2, 10))
        testCase(expected: 9.261, with: input(2.1, 3))
        testCase(expected: 0.25, with: input(2, -2))
    }
}
    
