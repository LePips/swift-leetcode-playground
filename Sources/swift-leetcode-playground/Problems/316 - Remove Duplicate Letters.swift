//
// Remove Duplicate Letters
//
// Difficulty: Medium
// https://leetcode.com/problems/remove-duplicate-letters
//

struct RemoveDuplicateLetters {
    func input(_ s: String) -> String {
        
        var d: [Character: Int] = [:]
        var stack: [Character] = []
        var v: Set<Character> = []
        
        for c in s.enumerated() {
            d[c.element] = c.offset
        }
        
        for c in s.enumerated() {
            if !v.contains(c.element) {
                
                while let l = stack.last, l > c.element, d[l]! > c.offset {
                    v.remove(stack.removeLast())
                }
                
                stack.append(c.element)
                v.insert(c.element)
            }
        }
        
        return String(stack)
    }
}

extension RemoveDuplicateLetters: Testable {

    var problemTitle: String {
        "316 - Remove Duplicate Letters.swift"
    }

    func test() {
        testCase(expected: "abc", with: input("bcabc"))
        testCase(expected: "acdb", with: input("cbacdcbc"))
    }
}
