//
// Two Sum
//
// Difficulty: Easy
// https://leetcode.com/problems/two-sum
//

struct TwoSum {
    func input(_ nums: [Int], _ target: Int) -> [Int] {
        
        var d: [Int: Int] = [:]
        
        for (i, num) in nums.enumerated() {
            if let a = d[target - num] {
                return [a, i]
            } else {
                d[num] = i
            }
        }
        
		return []
    }
}

extension TwoSum: Testable {

    var problemTitle: String {
        "1 - Two Sum.swift"
    }

    func test() {
//        testCase(expected: [0,1], with: { input([2,7,11,15], 9) })
        testCase(expected: [0, 1], with: input([2,7,11,15], 9))
    }
}
