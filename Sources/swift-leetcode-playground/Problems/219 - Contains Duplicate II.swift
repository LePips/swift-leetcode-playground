//
// Contains Duplicate II
//
// Difficulty: Easy
// https://leetcode.com/problems/contains-duplicate-ii
//

struct ContainsDuplicateII {
    func input(_ nums: [Int], _ k: Int) -> Bool {
        var d: [Int: Int] = [:]

        for j in nums.enumerated() {
            if let i = d[j.element], abs(i - j.offset) <= k {
                return true
            }
            
            d[j.element] = j.offset
        }

        return false
    }
}

extension ContainsDuplicateII: Testable {

    var problemTitle: String {
        "219 - Contains Duplicate II.swift"
    }

    func test() {
        testCase(expected: true, with: input([1,2,3,1], 3))
        testCase(expected: true, with: input([1,0,1,1], 1))
        testCase(expected: false, with: input([1,2,3,1,2,3], 2))
    }
}
