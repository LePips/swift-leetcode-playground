//
// Combination Sum
//
// Difficulty: Medium
// https://leetcode.com/problems/combination-sum
//

struct CombinationSum {
    
    func f(_ n: Int, _ c: [Int], _ v: [Int], _ d: inout [Int: [[Int]]]) -> [[Int]] {
        
        guard n >= 0 else { return [] }
        
        if n == 0 {
            return [v]
        }
        
        if let k = d[n] {
            return k
        }
        
        var t: [[Int]] = []
        
        for ni in c {
            if n - ni < 0 {
                continue
            }
            
            var vi = v
            vi.append(ni)
            
            t += f(n - ni, c, vi, &d)
        }
        
        d[n] = t
        
        return t
    }
    
    func input(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var d: [Int: [[Int]]] = [:]
        
        let a = f(target, candidates, [], &d)
        
        print(d)
        
        return d[target]!.filter { v in
            let d = Dictionary(grouping: v, by: { $0 })
                .mapValues { $0.count }
            
            return Set(d.values).count == d.values.count
        }
    }
}

extension CombinationSum: Testable {

    var problemTitle: String {
        "39 - Combination Sum.swift"
    }

    func test() {
        testCase(expected: [], with: input([2,3,6,7], 7))
    }
}
