//
// Search in Rotated Sorted Array
//
// Difficulty: Medium
// https://leetcode.com/problems/search-in-rotated-sorted-array
//

struct SearchinRotatedSortedArray {
    
    func binarySearch(_ nums: [Int], l: Int, r: Int, target: Int) -> Int? {
        
        var l = l
        var r = r
        
        while l <= r {
            var m = (l + r) / 2
            
            if nums[m] == target {
                return m
            }
            
            if nums[m] > target {
                r = m - 1
            } else {
                l = m  + 1
            }
        }
        
        return nil
    }
    
    func input(_ nums: [Int], _ target: Int) -> Int {
        
        var l = 0
        var r = nums.count - 1
        var m = 0

        while l < r {

            m = (l + r) / 2

            if nums[m] < nums[r] {
                r = m
            } else {
                l = m + 1
            }
        }

        m = (l + r) / 2
        
        if let a = binarySearch(nums, l: 0, r: m, target: target) {
            return a
        } else if let b = binarySearch(nums, l: m, r: nums.count - 1, target: target) {
            return b
        }

        return -1
    }
}

extension SearchinRotatedSortedArray: Testable {

    var problemTitle: String {
        "33 - Search in Rotated Sorted Array.swift"
    }

    func test() {
        testCase(expected: 4, with: input([4,5,6,7,0,1,2], 0))
        testCase(expected: -1, with: input([4,5,6,7,0,1,2], 3))
        testCase(expected: -1, with: input([-1], 0))
    }
}
