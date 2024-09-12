//
// Number of Islands
//
// Difficulty: Medium
// https://leetcode.com/problems/number-of-islands
//

struct NumberofIslands {
    
    func fill(_ grid: inout [[Character]], _ row: Int, _ col: Int) {
        guard row >= 0, row < grid.count, col >= 0, col < grid[row].count else { return }
        
        if grid[row][col] == "1" {
            grid[row][col] = "0"
            fill(&grid, row - 1, col)
            fill(&grid, row + 1, col)
            fill(&grid, row, col + 1)
            fill(&grid, row, col - 1)
        }
    }
    
    func input(_ grid: [[Character]]) -> Int {
        var grid = grid
        var t = 0
        
        for i in 0 ..< grid.count {
            for j in 0 ..< grid[0].count {
                if grid[i][j] == "0" { continue }
                t += 1
                fill(&grid, i, j)
            }
        }
        
        return t
    }
}

extension NumberofIslands: Testable {

    var problemTitle: String {
        "200 - Number of Islands.swift"
    }

    func test() {
        testCase(expected: 1, with: input([  ["1","1","1","1","0"],
                                             ["1","1","0","1","0"],
                                             ["1","1","0","0","0"],
                                             ["0","0","0","0","0"]]))
        testCase(expected: 3, with: input([  ["1","1","0","0","0"],
                                             ["1","1","0","0","0"],
                                             ["0","0","1","0","0"],
                                             ["0","0","0","1","1"]]))
    }
}
