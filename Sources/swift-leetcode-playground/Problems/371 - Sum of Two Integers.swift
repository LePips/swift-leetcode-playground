//
// Sum of Two Integers
//
// Difficulty: Medium
// https://leetcode.com/problems/sum-of-two-integers
//

struct SumofTwoIntegers {
    func input(_ a: Int, _ b: Int) -> Int {
        
        var a = a
        var b = b
        var c = 0
        var t = 0
        var i = 0
        
        print(String.init(a, radix: 2))
        print(String.init(b, radix: 2))

        while a > 0 || b > 0 {
            
            if c == 1 {
                t = t | (1 << i)
            }

            c = (a & 1) & (b & 1)

            if c == 0 {
                let n = (a & 1) | (b & 1)
                t = t | (n << i)
            }

            a >>= 1
            b >>= 1
            i += 1
            
            print(String.init(t, radix: 2))
        }
        
        t = t | (c << i)

        return t
    }
}

extension SumofTwoIntegers: Testable {

    var problemTitle: String {
        "371 - Sum of Two Integers.swift"
    }

    func test() {
//        testCase(expected: 3, with: input(1, 2))
//        testCase(expected: 5, with: input(2, 3))
        testCase(expected: 50, with: input(20, 30))
    }
}
