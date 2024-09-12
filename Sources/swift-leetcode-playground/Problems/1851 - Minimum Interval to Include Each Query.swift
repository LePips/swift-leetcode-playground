//
// Minimum Interval to Include Each Query
//
// Difficulty: Hard
// https://leetcode.com/problems/minimum-interval-to-include-each-query
//

struct MinimumIntervaltoIncludeEachQuery {
    
    struct Interval: Comparable {
        
        let left: Int
        let right: Int
        
        init(_ i: [Int]) {
            left = i[0]
            right = i[1]
        }
        
        var length: Int {
            right - left + 1
        }

        static func < (lhs: Interval, rhs: Interval) -> Bool {
            return lhs.right - lhs.left < rhs.right - rhs.left
        }
    }

    func input(_ intervals: [[Int]], _ queries: [Int]) -> [Int] {
        let intervals = intervals.sorted { $0[0] < $1[0] }
        let queries = queries.enumerated()
            .sorted { $0.1 < $1.1 }
        var heap: Heap<Interval> = []
        var t = Array(repeating: -1, count: queries.count)
        var j = 0

        // build heap queries iteratively
        for (i, q) in queries {
            // get new intervals that start less than query
            while j < intervals.count, intervals[j][0] <= q {
                heap.insert(.init(intervals[j]))
                j += 1
            }
            
            // remove intervals that end less than query
            while !heap.isEmpty, heap.min!.right < q {
                heap.removeMin()
            }
            
            if let m = heap.min {
                t[i] = m.length
            }
        }

        return t
     }
}

extension MinimumIntervaltoIncludeEachQuery: Testable {

    var problemTitle: String {
        "1851 - Minimum Interval to Include Each Query.swift"
    }

    func test() {
        testCase(expected: [3,3,1,4], with: input([[1,4],[2,4],[3,6],[4,4]], [2,3,4,5]))
        testCase(expected: [2,-1,4,6], with: input([[2,3],[2,5],[1,8],[20,25]], [2,19,5,22]))
    }
}
