//
// Find Missing Observations
//
// Difficulty: Medium
// https://leetcode.com/problems/find-missing-observations
//

struct FindMissingObservations {
    
    func input(_ rolls: [Int], _ mean: Int, _ n: Int) -> [Int] {
        
        let s = rolls.reduce(0, +)
        let rs = mean * (n + rolls.count) - s
        
        if rs > 6 * n || rs < n {
            return []
        }
        
        let dm = rs / n
        let rm = rs % n
        
        var t = Array(repeating: dm, count: n)
        
        for i in 0 ..< rm {
            t[i] += 1
        }
        
        return t
    }
}

extension FindMissingObservations: Testable {

    var problemTitle: String {
        "2028 - Find Missing Observations.swift"
    }

    func test() {
        testCase(expected: [6, 6], with: input([3,2,4,3], 4, 2))
        testCase(expected: [2,3,2,2], with: input([1,5,6], 3, 4))
    }
}
