//
// Pascal's Triangle
//
// Difficulty: Easy
// https://leetcode.com/problems/pascals-triangle
//

struct PascalsTriangle {
    func input(_ numRows: Int) -> [[Int]] {
        var t: [[Int]] = [[1]]

        // guard numRows > 1 else { return t }

        // t.append([1, 1])

        for i in 1 ..< numRows {

            var c: [Int] = []

            c.append(1)

            for j in 1 ..< i {
                let p = t[i - 1]
                let a = p[j - 1] + p[j]
                c.append(a)
            }

            c.append(1)

            t.append(c)
        }

        return t
    }
}

extension PascalsTriangle: Testable {

    var problemTitle: String {
        "118 - Pascal's Triangle.swift"
    }

    func test() {
        testCase(expected: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]], with: { input(5) })
        testCase(expected: [[1]], with: { input(1) })
    }
}
