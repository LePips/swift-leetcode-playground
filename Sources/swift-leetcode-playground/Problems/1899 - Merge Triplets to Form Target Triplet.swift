//
// Merge Triplets to Form Target Triplet
//
// Difficulty: Medium
// https://leetcode.com/problems/merge-triplets-to-form-target-triplet
//

struct MergeTripletstoFormTargetTriplet {
    func input(_ triplets: [[Int]], _ target: [Int]) -> Bool {
        var t: Set<Int> = []

        for triplet in triplets {
            if triplet[0] > target[0] || triplet[1] > target[1] || triplet[2] > target[2] {
                continue
            }

            for (index, val) in triplet.enumerated() {
                if val == target[index] {
                    t.insert(index)
                }
            }
        }
        return t.count == 3
    }
}

extension MergeTripletstoFormTargetTriplet: Testable {

    var problemTitle: String {
        "1899 - Merge Triplets to Form Target Triplet.swift"
    }

    func test() {
        testCase(expected: true, with: input([[2,5,3],[1,8,4],[1,7,5]], [2,7,5]))
        testCase(expected: false, with: input([[3,4,5],[4,5,6]], [3,2,5]))
        testCase(expected: true, with: input([[2,5,3],[2,3,4],[1,2,5],[5,2,3]], [5,5,5]))
        testCase(expected: false, with: input([[3,5,1],[10,5,7]], [3,5,7]))
        testCase(expected: false, with: input([[3,1,7],[1,5,10]], [3,5,7]))
    }
}
