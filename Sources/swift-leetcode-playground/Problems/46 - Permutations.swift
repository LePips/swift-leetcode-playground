//
// Permutations
//
// Difficulty: Medium
// https://leetcode.com/problems/permutations
//

struct Permutations {
    
    func f(_ l: [Int], _ r: [Int], _ n: [Int], _ final: inout [[Int]]) {
        for index in r.indices {
            let item = r[index]
            var l = l
            var r = r
            
            l.append(item)
            r.remove(at: index)
            
            if l.count == n.count {
                final.append(l)
            }
            
            f(l, r, n, &final)
        }
    }
    
    func input(_ nums: [Int]) -> [[Int]] {
        var final: [[Int]] = []
        
        f([], nums, nums, &final)
        
        return final
    }
}

extension Permutations: Testable {

    var problemTitle: String {
        "46 - Permutations.swift"
    }

    func test() {
        testCase(expected: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]], with: input([1,2,3]))
        testCase(expected: [[0,1],[1,0]], with: input([0,1]))
        testCase(expected: [[1]], with: input([1]))
    }
}
