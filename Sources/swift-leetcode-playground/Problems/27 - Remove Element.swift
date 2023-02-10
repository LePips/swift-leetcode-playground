//
// Remove Element
//
// Difficulty: Easy
// https://leetcode.com/problems/remove-element
//

struct RemoveElement {
    
    func input(_ nums: inout [Int], _ val: Int) -> Int {
        nums.removeAll(where: { $0 == val })
        return nums.count
    }
}

extension RemoveElement: Testable {

    var problemTitle: String {
        "27 - Remove Element.swift"
    }

    func test() {
        var array = [0,1,2,2,3,0,4,2]
        testCase(expected: 5, with: { input(&array, 2) })
    }
}
