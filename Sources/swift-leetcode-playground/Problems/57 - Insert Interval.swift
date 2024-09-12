//
// Insert Interval
//
// Difficulty: Medium
// https://leetcode.com/problems/insert-interval
//

struct InsertInterval {
    
    func m(_ x: [Int], _ y: [Int]) -> [Int] {
        [
            min(x[0], y[0]),
            max(x[1], y[1])
        ]
    }
    
    func input(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        
        var t: [[Int]] = []
        
        // prior to new interval
        var i = 0
        while i < intervals.count, intervals[i][1] < newInterval[0] {
            t.append(intervals[i])
            i += 1
        }
        
        // merge
        var newInterval = newInterval
        while i < intervals.count, intervals[i][0] < newInterval[1] {
            newInterval = m(intervals[0], newInterval)
            i += 1
        }
        
        t.append(newInterval)
        
        // after interval
        while i < intervals.count {
            t.append(intervals[i])
            i += 1
        }
        
        return t
    }
}

extension InsertInterval: Testable {

    var problemTitle: String {
        "57 - Insert Interval.swift"
    }

    func test() {
        testCase(expected: [[1,5],[6,9]], with: input([[1,3],[6,9]], [2,5]))
    }
}
