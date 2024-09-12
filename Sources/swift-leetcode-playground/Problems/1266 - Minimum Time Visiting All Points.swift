//
// Minimum Time Visiting All Points
//
// Difficulty: Easy
// https://leetcode.com/problems/minimum-time-visiting-all-points
//

struct MinimumTimeVisitingAllPoints {
    func input(_ points: [[Int]]) -> Int {
        0
//        var t = 0
//        var p1 = points[0]
//        
//        for i in 1 ..< points.count {
//            let p2 = points[i]
//            let dx = abs(p1[0] - p2[0])
//            let dy = abs(p1[1] - p2[1])
//            
//            p1 = p2
//            
//            t += max(dx, dy)
//        }
//        
//        return t
    }
}

extension MinimumTimeVisitingAllPoints: Testable {

    var problemTitle: String {
        "1266 - Minimum Time Visiting All Points.swift"
    }

    func test() {
//        testCase(expected: 7, with: input([[1,1],[3,4],[-1,0]]))
//        testCase(expected: 5, with: input([[3,2],[-2,2]]))
    }
}
