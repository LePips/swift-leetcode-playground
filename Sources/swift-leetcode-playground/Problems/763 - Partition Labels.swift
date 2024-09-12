//
// Partition Labels
//
// Difficulty: Medium
// https://leetcode.com/problems/partition-labels
//

//func merge(_ intervals: [[Int]]) -> [[Int]] {
//    
//    var intervals = intervals.sorted { $0[0] < $1[0] }
//    var i = 0
//    
//    while i < intervals.count - 1 {
//        // needs merge
//        if intervals[i][1] >= intervals[i + 1][0] {
//            intervals[i] = m(intervals[i], intervals[i + 1])
//            intervals.remove(at: i + 1)
//        } else {
//            i += 1
//        }
//    }
//    
//    return intervals
//}

struct PartitionLabels {
    
    func m(_ x: [Int], _ y: [Int]) -> [Int] {
        [
            min(x[0], y[0]),
            max(x[1], y[1])
        ]
    }
    
    func input(_ s: String) -> [Int] {
        let s = Array(s)
		let letters = Set(s)
        var intervals: [[Int]] = []
        
        for c in letters {
            let x = s.firstIndex(of: c)!
            let y = s.lastIndex(of: c)!
            
            intervals.append([x, y])
        }
        
        
        intervals = intervals.sorted { $0[0] < $1[0] }
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

        return intervals.map { $0[1] - $0[0] + 1 }
    }
}

extension PartitionLabels: Testable {

    var problemTitle: String {
        "763 - Partition Labels.swift"
    }

    func test() {
        testCase(expected: [9,7,8], with: input("ababcbacadefegdehijhklij"))
        testCase(expected: [10], with: input("eccbbbbdec"))
    }
}
