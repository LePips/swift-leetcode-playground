//
// Find the Difference of Two Arrays
//
// Difficulty: Easy
// https://leetcode.com/problems/find-the-difference-of-two-arrays
//

struct FindtheDifferenceofTwoArrays {
    func input(_ nums1: [Int], _ nums2: [Int]) -> [[Int]] {
        let a = Set(nums1)
        let b = Set(nums2)

        var ad: [Int] = []

        for num in a.sorted() {
            if !b.contains(num) {
                ad.append(num)
            }
        }
        
        var bd: [Int] = []
        
        for num in b.sorted() {
            if !a.contains(num) {
                bd.append(num)
            }
        }

        return [ad, bd]
    }
}

extension FindtheDifferenceofTwoArrays: Testable {

    var problemTitle: String {
        "2215 - Find the Difference of Two Arrays.swift"
    }

    func test() {
        testCase(expected: [[1,3],[4,6]], with: { input([1,2,3], [2,4,6]) })
        testCase(expected: [[3],[]], with: { input([1,2,3,3], [1,1,2,2]) })
    }
}
