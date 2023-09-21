//
// Search a 2D Matrix
//
// Difficulty: Medium
// https://leetcode.com/problems/search-a-2d-matrix
//

struct Searcha2DMatrix {
    
    func binarySearch(_ nums: [Int], target: Int) -> Int {
        
        var l = 0
        var r = nums.count - 1
        
        while l <= r {
            let m = (l + r) / 2
            
            if nums[m] == target {
                return m
            }
            
            if nums[m] > target {
                r = m - 1
            } else {
                l = m  + 1
            }
        }
        
        return -1
    }

    func arrayBinarySearch(_ matrix: [[Int]], target: Int) -> Int {
        
        var l = 0
        var r = matrix.count - 1
        var m = 0

        while l < r {
            m = (l + r) / 2

            let mr = matrix[m]

            if mr.first! <= target && mr.last! >= target {
                return m
            } else if mr[0] > target {
                r = m - 1
            } else {
                l = m + 1
            }
        }
        
        m = (l + r) / 2

        return m
    }
    
    func input(_ matrix: [[Int]], _ target: Int) -> Bool {
        
        let row = arrayBinarySearch(matrix, target: target)
        let i = binarySearch(matrix[row], target: target)
        
//        print("\(row), \(i)")
		
        return i != -1
    }
}

extension Searcha2DMatrix: Testable {

    var problemTitle: String {
        "74 - Search a 2D Matrix.swift"
    }

    func test() {
        testCase(expected: true, with: input([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 3))
        testCase(expected: false, with: input([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 13))
        testCase(expected: true, with: input([[1],[3]], 1))
        testCase(expected: true, with: input([[1,3,5,7],[10,11,16,20],[23,30,34,50]], 10))
        testCase(expected: true, with: input([[-10,-10],[-9,-9],[-8,-6],[-4,-2],[0,1],[3,3],[5,5],[6,8]], 0))
    }
}
