//
// Palindrome Number
//
// Difficulty: Easy
// https://leetcode.com/problems/palindrome-number
//

struct PalindromeNumber {
    func isPalindrome(_ x: Int) -> Bool {
        guard x > -1 else { return false }
        guard x > 9 else { return true }
        
        var tmp = x
        var c: [Int] = []
        
        while tmp > 0 {
            c.append(tmp % 10)
            tmp = tmp / 10
        }
        
        for i in 0..<(c.count / 2) where c[i] != c[c.count - 1 - i] {
            return false
        }
        
        return true
    }
}

extension PalindromeNumber: Testable {
    
    var problemTitle: String {
        "9 - Palindrome Number"
    }
    
    func test() {
        testCase(expected: true, with: { isPalindrome(121) })
        testCase(expected: false, with: { isPalindrome(10) })
        testCase(expected: true, with: { isPalindrome(121212121212121) })
        testCase(expected: true, with: { isPalindrome(0) })
        testCase(expected: false, with: { isPalindrome(-121) })
    }
}
