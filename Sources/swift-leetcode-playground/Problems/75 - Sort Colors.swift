//
// Sort Colors
//
// Difficulty: Medium
// https://leetcode.com/problems/sort-colors
//

struct SortColors {
    func input(_ nums: inout [Int]) {
        var z = 0
        var t = nums.count - 1
        var i = 0
        
        while i <= t {
            if nums[i] == 0, i > z {
                nums.swapAt(i, z)
                z += 1
            } else if nums[i] == 2, i < t {
                nums.swapAt(i, t)
                t -= 1
            } else {
                i += 1
            }
        }
    }
}

extension SortColors: Testable {

    var problemTitle: String {
        "75 - Sort Colors.swift"
    }

    func test() {

    }
}
