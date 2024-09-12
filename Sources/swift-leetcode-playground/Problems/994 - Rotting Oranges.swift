//
// Rotting Oranges
//
// Difficulty: Medium
// https://leetcode.com/problems/rotting-oranges
//

struct RottingOranges {
    
    struct Coordinate: Hashable {
        let x: Int
        let y: Int
        
        var neighbors: [Coordinate] {
            [
                Coordinate(x: x - 1, y: y),
                Coordinate(x: x + 1, y: y),
                Coordinate(x: x, y: y + 1),
                Coordinate(x: x, y: y - 1),
            ]
        }
    }
    
    func isFresh(_ c: Coordinate, _ g: [[Int]]) -> Bool {
        guard c.x >= 0, c.x < g.count, c.y >= 0, c.y < g[0].count else { return false }
        return g[c.x][c.y] == 1
    }
    
    /// Returns `true` if did rot fruit
    func iterate(_ grid: inout [[Int]], _ rc: inout Set<Coordinate>) -> Bool {
        
        var nf: Set<Coordinate> = []
        
        for r in rc {
            let neighbors = r.neighbors
            
            var a: Set<Coordinate> = []
            
            for c in neighbors {
                if isFresh(c, grid) {
                    a.insert(c)
                    grid[c.x][c.y] = 2
                }
            }
            
            if a.isEmpty {
                rc.remove(r)
            } else {
                nf.formUnion(a)
            }
        }
        
        rc.formUnion(nf)
        
        guard !nf.isEmpty else { return false }
        
        return true
    }
    
    func input(_ grid: [[Int]]) -> Int {
        
        var grid = grid
        var rc: Set<Coordinate> = []
        
        for i in 0 ..< grid.count {
            for j in 0 ..< grid[0].count {
                if grid[i][j] == 2 {
                    rc.insert(Coordinate(x: i, y: j))
                }
            }
        }
        
        var t = 0
        
        while !rc.isEmpty {
            if iterate(&grid, &rc) {
                t += 1
            } else {
                break
            }
        }
        
        for i in 0 ..< grid.count {
            if grid[i].contains(1) {
                return -1
            }
        }
        
        return t
    }
}

extension RottingOranges: Testable {

    var problemTitle: String {
        "994 - Rotting Oranges.swift"
    }

    func test() {
        testCase(expected: 4, with: input([[2,1,1],[1,1,0],[0,1,1]]))
        testCase(expected: -1, with: input([[2,1,1],[0,1,1],[1,0,1]]))
        testCase(expected: 0, with: input([[0,2]]))
    }
}
