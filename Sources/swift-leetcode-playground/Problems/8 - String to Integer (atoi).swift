//
// String to Integer (atoi)
//
// Difficulty: Medium
// https://leetcode.com/problems/string-to-integer-atoi
//

struct StringtoIntegeratoi {
    func input(_ s: String) -> Int {
        let nums = [1,2,3,4,5,6,7,8,9,0].map { "\($0)" }
        let signs = ["-", "+"]

        var r = ""
        var isNegative = false
        var gotSign = false

        for i in s.indices {
            let c = String(s[i])

            if c == " " {
                if r.isEmpty, !gotSign {
                    continue
                } else {
                    break
                }
            }

            if signs.contains(c) {
                if r.isEmpty, !gotSign {
                    gotSign = true
                    
                    if c == "-" {
                        isNegative = true
                    }

                    continue
                } else {
                    break
                }
            }

            if nums.contains(c) {
                r.append(c)
            } else {
                break
            }
        }
        
        guard !r.isEmpty else { return 0 }
        
        r.trimPrefix { $0 == "0" }
        
        var t = Int(r.prefix(11)) ?? 0
        
        t = isNegative ? -t : t
        
        return max(min(t, 2_147_483_647), -2_147_483_648)
    }
}

extension StringtoIntegeratoi: Testable {

    var problemTitle: String {
        "8 - String to Integer (atoi).swift"
    }

    func test() {
        testCase(expected: 42, with: input("42"))
        testCase(expected: -42, with: input(" -042"))
        testCase(expected: 1337, with: input("1337c0d3"))
        testCase(expected: -2147483648, with: input("-91283472332"))
        testCase(expected: 0, with: input("+-12"))
        testCase(expected: 0, with: input("   +0 123"))
        testCase(expected: 2147483647, with: input("20000000000000000000"))
        testCase(expected: 12345678, with: input("  0000000000012345678"))
        testCase(expected: 0, with: input("  +  413"))
    }
}
