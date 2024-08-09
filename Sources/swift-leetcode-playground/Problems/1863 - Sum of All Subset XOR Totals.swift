//
// Sum of All Subset XOR Totals
//
// Difficulty: Easy
// https://leetcode.com/problems/sum-of-all-subset-xor-totals
//

struct SumofAllSubsetXORTotals {
    func input(_ nums: [Int]) -> Int {
        let maskRange = 1 ..< (1 << nums.count)

        return maskRange.reduce(0) { s, mask in
            s + nums.indices.reduce(0) { si, index in
                let isIncluded = (mask & (1 << index)) != 0
                return isIncluded ? si ^ nums[index] : si
            }
        }
    }
}

extension SumofAllSubsetXORTotals: Testable {

    var problemTitle: String {
        "1863 - Sum of All Subset XOR Totals.swift"
    }

    func test() {

    }
}
