//
// Pacific Atlantic Water Flow
//
// Difficulty: Medium
// https://leetcode.com/problems/pacific-atlantic-water-flow
//

import OrderedCollections

struct PacificAtlanticWaterFlow {
    
    func input(_ heights: [[Int]]) -> [[Int]] {
        
        func dfs(_ r: Int, _ c: Int, _ ocean: inout [[Bool]]) {
            ocean[r][c] = true
            
            for dir in [[1,0],[0,1],[-1,0],[0,-1]] {
                let (nr, nc) = (r + dir[0], c + dir[1])
                
                if nr >= 0 && nr < rows && nc >= 0 && nc < cols && !ocean[nr][nc] && heights[nr][nc] >= heights[r][c] {
                    dfs(nr, nc, &ocean)
                }
            }
        }
        
        let rows = heights.count
        let cols = heights[0].count
        
        var pacific = Array(repeating: Array(repeating: false, count: cols), count: rows)
        var atlantic = Array(repeating: Array(repeating: false, count: cols), count: rows)

        for c in 0 ..< cols {
            dfs(0, c, &pacific)
            dfs(rows - 1, c, &atlantic)
        }

        for r in 0 ..< rows {
            dfs(r, 0, &pacific)
            dfs(r, cols - 1, &atlantic)
        }

        var t: [[Int]] = []
        
        for r in 0 ..< rows {
            for c in 0 ..< cols {
                if pacific[r][c] && atlantic[r][c] {
                    t.append([r,c])
                }
            }
        }
        
        return t
    }
}

extension PacificAtlanticWaterFlow: Testable {

    var problemTitle: String {
        "417 - Pacific Atlantic Water Flow.swift"
    }

    func test() {
        testCase(
            expected: [[0,4],[1,3],[1,4],[2,2],[3,0],[3,1],[4,0]],
            with: input([[1,2,2,3,5],[3,2,3,4,4],[2,4,5,3,1],[6,7,1,4,5],[5,1,1,2,4]])
        )
        testCase(expected: [[0, 0]], with: input([[1]]))
    }
}
