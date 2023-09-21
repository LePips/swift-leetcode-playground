//
// Find First and Last Position of Element in Sorted Array
//
// Difficulty: Medium
// https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array
//

struct FindFirstandLastPositionofElementinSortedArray {
    
    func bs(_ nums: ArraySlice<Int>, target: Int) -> Int {
        var l = 0
        var r = nums.count - 1

        while l <= r {
            let m = (l + r) / 2

            if nums[m] == target {
                return m
            }

            if nums[m] < target {
                l = m + 1
            } else {
                r = m - 1
            }
        }

        return -1
    }
    
    func input(_ nums: [Int], _ target: Int) -> [Int] {
        let t = bs(nums[..<nums.count], target: target)
        
        if t == -1 {
            return [-1, -1]
        } else {
            
            let l = bs(nums[..<t], target: target)
            let r = t + bs(nums[(t - 1)...], target: target)
            
            return [l, r]
        }
    }
}

extension FindFirstandLastPositionofElementinSortedArray: Testable {

    var problemTitle: String {
        "34 - Find First and Last Position of Element in Sorted Array.swift"
    }

    func test() {
        testCase(expected: [3,4], with: input([5,7,7,8,8,10], 8))
//        testCase(expected: [-1,-1], with: input([5,7,7,8,8,10], 6))
//        testCase(expected: [-1,-1], with: input([], 0))
    }
}
