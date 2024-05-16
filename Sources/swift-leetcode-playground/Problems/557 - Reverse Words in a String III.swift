//
// Reverse Words in a String III
//
// Difficulty: Easy
// https://leetcode.com/problems/reverse-words-in-a-string-iii
//

struct ReverseWordsinaStringIII {
    func input(_ s: String) -> String {
        s.split(separator: " ")
            .map { String($0.reversed()) }
            .joined(separator: " ")
    }
}

extension ReverseWordsinaStringIII: Testable {

    var problemTitle: String {
        "557 - Reverse Words in a String III.swift"
    }

    func test() {
        testCase(expected: "s'teL ekat edoCteeL tsetnoc", with: input("Let's take LeetCode contest"))
    }
}
