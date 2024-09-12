//
// Minimum Bit Flips to Convert Number
//
// Difficulty: Easy
// https://leetcode.com/problems/minimum-bit-flips-to-convert-number
//

struct MinimumBitFlipstoConvertNumber {
    func input(_ start: Int, _ goal: Int) -> Int {
        let d = (start ^ goal)
        var c = 0
        
        for i in 0 ..< Int.bitWidth {
            if d & 1 << i > 0 {
                c += 1
            }
        }
        
        return c
    }
}

extension MinimumBitFlipstoConvertNumber: Testable {

    var problemTitle: String {
        "2220 - Minimum Bit Flips to Convert Number.swift"
    }

    func test() {
        testCase(expected: 3, with: input(10, 7))
        testCase(expected: 3, with: input(3, 4))
    }
}
