//
// Single Number
//
// Difficulty: Easy
// https://leetcode.com/problems/single-number
//

struct SingleNumber {
    func input(_ nums: [Int]) -> Int {
        nums.reduce(0, ^)
    }
}

extension SingleNumber: Testable {

    var problemTitle: String {
        "136 - Single Number.swift"
    }

    func test() {
        testCase(expected: 4, with: input([4,1,1,2,2]))
        testCase(expected: 1, with: input([1]))
        testCase(expected: 69, with: input([1,1,2,2,3,3,4,4,5,5,6,6,69]))
    }
}
