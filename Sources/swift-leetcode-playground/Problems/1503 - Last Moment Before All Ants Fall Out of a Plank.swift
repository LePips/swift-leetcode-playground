//
// Last Moment Before All Ants Fall Out of a Plank
//
// Difficulty: Medium
// https://leetcode.com/problems/last-moment-before-all-ants-fall-out-of-a-plank
//

struct LastMomentBeforeAllAntsFallOutofaPlank {
    func input(_ n: Int, _ left: [Int], _ right: [Int]) -> Int {
        let l = left.max() ?? 0
        let r = right.min() ?? n

        return max(l, n - r)
    }
}

extension LastMomentBeforeAllAntsFallOutofaPlank: Testable {

    var problemTitle: String {
        "1503 - Last Moment Before All Ants Fall Out of a Plank.swift"
    }

    func test() {
        testCase(expected: 4, with: input(4, [4,3], [0,1]))
        testCase(expected: 7, with: input(7, [], [0,1,2,3,4,5,6,7]))
        testCase(expected: 7, with: input(7, [0,1,2,3,4,5,6,7], []))
        testCase(expected: 0, with: input(1000, [0], []))
    }
}
