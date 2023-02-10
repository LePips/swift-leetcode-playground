//
// Longest Common Prefix
//
// Difficulty: Easy
// https://leetcode.com/problems/longest-common-prefix
//

struct LongestCommonPrefix {
    func longestCommonPrefix(_ strs: [String]) -> String {
        
        if strs.count == 1 {
            return strs[0]
        }
        
        let strs = strs.sorted()
        var prefix = ""
        
        // Only need to look at the first and last strings
        // as the list is sorted alphabetically and by length.
        // The common letters only come from these two strings.
        for (i, j) in zip(strs.first!, strs.last!) {
            if i == j {
                prefix.append(i)
            } else {
                return prefix
            }
        }
        
        return prefix
    }
}

extension LongestCommonPrefix: Testable {
    
    var problemTitle: String {
        "14 - Longest Common Prefix"
    }
    
    func test() {
        testCase(expected: "fl", with: { longestCommonPrefix(["flower","flow","flight"]) })
        testCase(expected: "", with: { longestCommonPrefix(["dog","racecar","car"]) })
        testCase(expected: "", with: { longestCommonPrefix([""]) })
        testCase(expected: "a", with: { longestCommonPrefix(["a"]) })
        testCase(expected: "a", with: { longestCommonPrefix(["a", "ab"]) })
        testCase(expected: "a", with: { longestCommonPrefix(["ab", "a"]) })
    }
}
