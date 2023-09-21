//
// Koko Eating Bananas
//
// Difficulty: Medium
// https://leetcode.com/problems/koko-eating-bananas
//

import Darwin

struct KokoEatingBananas {
    
    func nh(_ piles: [Int], _ k: Int) -> Int {
        piles
            .map { Int(ceil(Double($0) / Double(k))) }
            .reduce(0, +)
    }
    
    func input(_ piles: [Int], _ h: Int) -> Int {
		var l = 1
        var r = piles.max()!
        var t = r
        
        while l <= r {
            let m = (l + r) / 2
            let hours = nh(piles, m)
            
            if hours <= h {
                t = m
                r = m - 1
            } else {
                l = m + 1
            }
            
        }
        
        return t
    }
}

extension KokoEatingBananas: Testable {

    var problemTitle: String {
        "875 - Koko Eating Bananas.swift"
    }

    func test() {
        testCase(expected: 4, with: input([3,6,7,11], 8))
    }
}
