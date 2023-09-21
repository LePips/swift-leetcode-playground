//
// Container With Most Water
//
// Difficulty: Medium
// https://leetcode.com/problems/container-with-most-water
//

struct ContainerWithMostWater {
    func input(_ height: [Int]) -> Int {
        var t = 0
        var i = 0
        var j = height.count - 1

        // Look at ends.
        // Move the shorter side closer to the other
        while i < j {
            let x = j - i
            let a = x * min(height[i], height[j])

            t = max(a, t)

            if height[i] < height[j] {
                i += 1
            } else {
                j -= 1
            }
        }

        return t
    }
}

extension ContainerWithMostWater: Testable {

    var problemTitle: String {
        "11 - Container With Most Water.swift"
    }

    func test() {
        testCase(expected: 49, with: { input([1, 8, 6, 2, 5, 4, 8, 3, 7]) })
        testCase(expected: 1, with: { input([1, 1]) })
    }
}
