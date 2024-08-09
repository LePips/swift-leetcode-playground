//
// Minimum Number of Pushes to Type Word II
//
// Difficulty: Medium
// https://leetcode.com/problems/minimum-number-of-pushes-to-type-word-ii
//

struct MinimumNumberofPushestoTypeWordII {
    func input(_ word: String) -> Int {
        let w = word.utf8CString.dropLast()
        let freq = Dictionary(w.map { ($0,1) }, uniquingKeysWith: +)
        
        return zip(8..., freq.values.sorted(by: >))
            .map { $0 / 8 * $1 }
            .reduce(0, +)
    }
}

extension MinimumNumberofPushestoTypeWordII: Testable {

    var problemTitle: String {
        "3016 - Minimum Number of Pushes to Type Word II.swift"
    }

    func test() {
        testCase(expected: 5, with: input("abcde"))
        testCase(expected: 12, with: input("xyzxyzxyzxyz"))
        testCase(expected: 24, with: input("aabbccddeeffgghhiiiiii"))
    }
}
