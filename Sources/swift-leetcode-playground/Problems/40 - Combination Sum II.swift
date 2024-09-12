//
// Combination Sum II
//
// Difficulty: Medium
// https://leetcode.com/problems/combination-sum-ii
//

struct CombinationSumII {

    func input(_ candidates: [Int], _ target: Int) -> [[Int]] {
        
        guard target > 0 else { return [[]] }
        
        let candidates = candidates
            .reduce(into: [:]) { $0[$1, default: 0] += 1 }
            .sorted(by: { $0.key < $1.key })
        
        var result: [[Int]] = []
        var combs: [(sum: Int, array: [Int])] = [(0, [])]
        
        for (n, count) in candidates {
            for i in 0 ..< combs.count {
                var update = combs[i]
                
                for _ in 0 ..< count {
                    guard update.sum + n <= target else { break }
                    update.sum += n
                    update.array.append(n)
                    
                    if update.sum == target {
                        result.append(update.array)
                    } else {
                        combs.append(update)
                    }
                }
            }
        }
    
        return result
    }
}

extension CombinationSumII: Testable {

    var problemTitle: String {
        "40 - Combination Sum II.swift"
    }

    func test() {
        testCase(expected: [], with: input([10,1,2,7,6,1,5], 8))
    }
}
