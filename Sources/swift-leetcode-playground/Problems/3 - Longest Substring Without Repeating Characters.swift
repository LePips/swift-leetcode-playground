//
// Longest Substring Without Repeating Characters
//
// Difficulty: Medium
// https://leetcode.com/problems/longest-substring-without-repeating-characters
//

struct LongestSubstringWithoutRepeatingCharacters {
    func input(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        
        var len = 0
        var window: [Character] = []
        
        for c in s {
            // If current character already in window,
            // remove up to index of that character
            if let idx = window.firstIndex(of: c) {
                window.removeSubrange(0...idx)
            }
            
            // Shift window up by 1
            window.append(c)
            
            // Longest substring check
            len = max(len, window.count)
        }
        
        return len
    }
}

extension LongestSubstringWithoutRepeatingCharacters: Testable {

    var problemTitle: String {
        "3 - Longest Substring Without Repeating Characters.swift"
    }

    func test() {
        testCase(expected: 3, with: { input("abcabcbb") })
        testCase(expected: 1, with: { input("bbbbb") })
        testCase(expected: 3, with: { input("pwwkew") })
    }
}
