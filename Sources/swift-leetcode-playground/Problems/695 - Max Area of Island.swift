//
// Max Area of Island
//
// Difficulty: Medium
// https://leetcode.com/problems/max-area-of-island
//

struct MaxAreaofIsland {
    
    func fill(_ grid: inout [[Int]], _ row: Int, _ col: Int) -> Int {
        guard row >= 0, row < grid.count, col >= 0, col < grid[row].count else { return 0 }
        
        var t = 0
        
        if grid[row][col] == 1 {
            grid[row][col] = 0
            t += 1
            
            t += fill(&grid, row - 1, col)
            t += fill(&grid, row + 1, col)
            t += fill(&grid, row, col + 1)
            t += fill(&grid, row, col - 1)
        }
        
        return t
    }
    
    func input(_ grid: [[Int]]) -> Int {
        var grid = grid
        var t = 0
        
        for i in 0 ..< grid.count {
            for j in 0 ..< grid[0].count {
                if grid[i][j] == 0 { continue }
                t = max(t, fill(&grid, i, j))
            }
        }
        
        return t
    }
}

extension MaxAreaofIsland: Testable {

    var problemTitle: String {
        "695 - Max Area of Island.swift"
    }

    func test() {
        testCase(expected: 6, with: input([[0,0,1,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,1,1,0,1,0,0,0,0,0,0,0,0],[0,1,0,0,1,1,0,0,1,0,1,0,0],[0,1,0,0,1,1,0,0,1,1,1,0,0],[0,0,0,0,0,0,0,0,0,0,1,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,0,1,1,0,0,0,0]]))
        testCase(expected: 0, with: input([[0,0,0,0,0,0,0,0]]))
    }
}
