//
// Subsets
//
// Difficulty: Medium
// https://leetcode.com/problems/subsets
//

import Foundation

//func subsets(_ nums: [Int]) -> [[Int]] {
//    var ans:[[Int]] = []
//    for i in 0..<nums.count{
//        for j in 0..<ans.count{
//            var temp = ans[j]
//            temp.append(nums[i])
//            ans.append(temp)
//        }
//        ans.append([nums[i]])
//    }
//    ans.append([])
//    return ans
//}

struct Subsets {
    func input(_ nums: [Int]) -> [[Int]] {
        var mask = 0 ..< (1 << nums.count)

        var f: [[Int]] = []

        for i in mask {
            let t: [Int] = nums.indices.reduce([]) {
                let inSubset = (i & (1 << $1)) != 0

                if inSubset {
                    var j = $0
                    j.append(nums[$1])
                    return j
                } else {
                    return $0
                }
            }
            
            f.append(t)
        }

        return f
    }
}

extension Subsets: Testable {

    var problemTitle: String {
        "78 - Subsets.swift"
    }

    func test() {
        testCase(expected: [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]], with: input([1,2,3]))
    }
}
