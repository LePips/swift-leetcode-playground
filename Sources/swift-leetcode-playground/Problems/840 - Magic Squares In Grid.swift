//
// Magic Squares In Grid
//
// Difficulty: Medium
// https://leetcode.com/problems/magic-squares-in-grid
//

struct MagicSquaresInGrid {
    
    func isMagic(_ i: Int, _ j: Int, _ g: [[Int]]) -> Int {
        if g.count - i < 3 || g[i].count - j < 3 {
            return 0
        }
        
        let b = g[i][j...j + 2] + g[i + 1][j...j + 2] + g[i + 2][j...j + 2]
        
        guard b.allSatisfy({ $0 < 10 && $0 > 0 }) else { return 0 }
        guard Set(b).count == 9 else { return 0 }

        var t = 0

        // rows

        let r1 = g[i][j] + g[i][j + 1] + g[i][j + 2]
        let r2 = g[i + 1][j] + g[i + 1][j + 1] + g[i + 1][j + 2]
        let r3 = g[i + 2][j] + g[i + 2][j + 1] + g[i + 2][j + 2]

        guard r1 == r2, r2 == r3 else { return 0 }

        t = r1

        // cols

        let c1 = g[i][j] + g[i + 1][j] + g[i + 2][j]
        let c2 = g[i][j + 1] + g[i + 1][j + 1] + g[i + 2][j + 1]
        let c3 = g[i][j + 2] + g[i + 1][j + 2] + g[i + 2][j + 2]

        guard t == c1, c1 == c2, c2 == c3 else { return 0 }

        // diags
        let d1 = g[i][j] + g[i + 1][j + 1] + g[i + 2][j + 2]
        let d2 = g[i][j + 2] + g[i + 1][j + 1] + g[i + 2][j]

        guard d1 == t, d1 == d2 else { return 0 }

        return 1
    }

    func input(_ grid: [[Int]]) -> Int {
        var t = 0

        for i in 0 ..< grid.count {
            for j in 0 ..< grid[0].count {
                t += isMagic(i, j, grid)
            }
        }

        return t
    }
}

extension MagicSquaresInGrid: Testable {

    var problemTitle: String {
        "840 - Magic Squares In Grid.swift"
    }

    func test() {
        testCase(expected: 1, with: input([[4,3,8,4],[9,5,1,9],[2,7,6,2]]))
        testCase(expected: 0, with: input([[8]]))
        testCase(expected: 0, with: input([[5,5,5], [5,5,5], [5,5,5]]))
        testCase(expected: 0, with: input([[7,0,5],[2,4,6],[3,8,1]]))
    }
}
