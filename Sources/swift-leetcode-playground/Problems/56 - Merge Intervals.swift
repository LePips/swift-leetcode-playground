//
// Merge Intervals
//
// Difficulty: Medium
// https://leetcode.com/problems/merge-intervals
//

struct MergeIntervals {
    
    func m(_ x: [Int], _ y: [Int]) -> [Int] {
        [
            min(x[0], y[0]),
            max(x[1], y[1])
        ]
    }
    
    func input(_ intervals: [[Int]]) -> [[Int]] {
        
        var intervals = intervals.sorted { $0[0] < $1[0] }
        var i = 0
        
        while i < intervals.count - 1 {
            // needs merge
            if intervals[i][1] >= intervals[i + 1][0] {
                intervals[i] = m(intervals[i], intervals[i + 1])
                intervals.remove(at: i + 1)
            } else {
                i += 1
            }
        }
        
        return intervals
    }
}

extension MergeIntervals: Testable {

    var problemTitle: String {
        "56 - Merge Intervals.swift"
    }

    func test() {
        testCase(expected: [[1,6],[8,10],[15,18]], with: input([[1,3],[2,6],[8,10],[15,18]]))
        testCase(expected: [[1,5]], with: input([[1,4],[4,5]]))
    }
}
