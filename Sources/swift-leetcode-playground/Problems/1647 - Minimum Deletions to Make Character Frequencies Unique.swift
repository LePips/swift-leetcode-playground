//
// Minimum Deletions to Make Character Frequencies Unique
//
// Difficulty: Medium
// https://leetcode.com/problems/minimum-deletions-to-make-character-frequencies-unique
//

struct MinimumDeletionstoMakeCharacterFrequenciesUnique {
    
    func f(_ k: Int, _ d: inout [Int: Int]) -> Int {
        var t = 0
        var v = d[k]!
        
        while v > 1 {
            if v > 1 {
                v -= 1
                
                var cv = k
                
                while cv > 0 {
                    t += 1
                    cv -= 1
                    
                    if !d.keys.contains(cv) {
                        d[cv] = 1
                        break
                    }
                }
            }
        }
        
        return t
    }
    
    func input(_ s: String) -> Int {
        
        let d = Dictionary(grouping: s, by: { $0 })
        var de = Dictionary(grouping: d.values, by: { $0.count })
            .mapValues { $0.count }
        
        guard !de.values.allSatisfy({ $0 == 1 }) else { return 0 }
        
        var t = 0
        
        for k in de.keys {
            t += f(k, &de)
        }
        
        return t
    }
}

extension MinimumDeletionstoMakeCharacterFrequenciesUnique: Testable {

    var problemTitle: String {
        "1647 - Minimum Deletions to Make Character Frequencies Unique.swift"
    }

    func test() {
        testCase(expected: 0, with: input("aab"))
        testCase(expected: 2, with: input("aaabbbcc"))
        testCase(expected: 2, with: input("ceabaacb"))
        testCase(expected: 3, with: input("abcabc"))
    }
}
