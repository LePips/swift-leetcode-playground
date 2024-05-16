//
// Cells with Odd Values in a Matrix
//
// Difficulty: Easy
// https://leetcode.com/problems/cells-with-odd-values-in-a-matrix
//

struct CellswithOddValuesinaMatrix {
    
    func incCol(_ g: inout [[Int]], _ i: Int) {
        for j in 0 ..< g.count {
            g[j][i] = g[j][i] + 1
        }
    }

    func incRow(_ g: inout [[Int]], _ i: Int) {
        g[i] = g[i].map { $0 + 1}
    }

    func input(_ m: Int, _ n: Int, _ indices: [[Int]]) -> Int {
        var n = Array(repeating: Array(repeating: 0, count: n), count: m)

        for index in indices {
            incRow(&n, index[0])
            incCol(&n, index[1])
        }

        return n.map { row in
            row.reduce(0) { x, y in
                let isOdd = y % 2 == 1

                return x + (isOdd ? 1 : 0)
            }
        }
        .reduce(0, +)
    }
}

extension CellswithOddValuesinaMatrix: Testable {

    var problemTitle: String {
        "1252 - Cells with Odd Values in a Matrix.swift"
    }

    func test() {
        testCase(expected: 6, with: input(2, 3, [[0, 1], [1, 1]]))
        testCase(expected: 0, with: input(2, 2, [[1, 1], [0, 0]]))
    }
}
