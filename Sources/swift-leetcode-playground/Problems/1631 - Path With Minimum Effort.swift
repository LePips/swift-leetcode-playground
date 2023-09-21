//
// Path With Minimum Effort
//
// Difficulty: Medium
// https://leetcode.com/problems/path-with-minimum-effort
//

//let (rows, cols) = (heights.count, heights[0].count)
//var dp = heights.map {$0.map{ _ in Int.max}}
//dp[0][0] = 0
//var bfs = [(0,0)]
//while !bfs.isEmpty {
//    let (x,y) = bfs.removeFirst()
//    let moves = [(0,1),(0,-1),(1,0),(-1,0)].lazy.map{(x+$0.0, y+$0.1)}
//    for (newX, newY) in moves where 0..<cols ~= newX && 0..<rows ~= newY {
//        let effort = max(dp[y][x], abs(heights[y][x] - heights[newY][newX]))
//        guard dp[newY][newX] > effort else { continue }
//        dp[newY][newX] = effort
//        bfs.append((newX, newY))
//    }
//}
//return dp.last!.last!

struct PathWithMinimumEffort {
    func input(_ heights: [[Int]]) -> Int {
		
        let cc = heights[0].count
        let rc = heights.count
        var d = Array(repeating: Array(repeating: Int.max, count: cc), count: rc)
        var bfs = [(0, 0)]
        
        d[0][0] = 0
        
        while !bfs.isEmpty {
            let (x, y) = bfs.removeFirst()
            let moves = [(0, 1), (0, -1), (1, 0), (-1, 0)]
                .lazy
                .map { (x + $0.0, y + $0.1) }
            
            for (nx, ny) in moves where 0 ..< cc ~= nx && 0 ..< rc ~= ny {
                let e = max(
                    d[y][x],
                    abs(heights[y][x] - heights[ny][nx])
                )
                
                guard d[ny][nx] > e else { continue }
                
                d[ny][nx] = e
                
                bfs.append((nx, ny))
            }
        }
        
        return d.last!.last!
    }
}

extension PathWithMinimumEffort: Testable {

    var problemTitle: String {
        "1631 - Path With Minimum Effort.swift"
    }

    func test() {

    }
}
