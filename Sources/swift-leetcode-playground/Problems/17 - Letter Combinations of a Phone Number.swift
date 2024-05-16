//
// Letter Combinations of a Phone Number
//
// Difficulty: Medium
// https://leetcode.com/problems/letter-combinations-of-a-phone-number
//

struct LetterCombinationsofaPhoneNumber {
    func input(_ digits: String) -> [String] {
        let letters: [UInt8: String] = [
            2: "abc",
            3: "def",
            4: "ghi",
            5: "jkl",
            6: "mno",
            7: "pqrs",
            8: "tuv",
            9: "wxyz",
        ]
        
        var t: [String] = []
        
        for digit in digits {
            let i = digit.asciiValue! - 48
            
            if t.isEmpty {
                for l in letters[i]! {
                    t.append(String(l))
                }
            } else {
                t = t.reduce([]) { partialResult, tl in
                    let n: [String] = letters[i]!.reduce([]) { r, c in
                        return r + [tl.appending(String(c))]
                    }
                    
                    return partialResult + n
                }
            }
        }
        
        return t
    }
}

extension LetterCombinationsofaPhoneNumber: Testable {

    var problemTitle: String {
        "17 - Letter Combinations of a Phone Number.swift"
    }

    func test() {
        testCase(expected: ["ad","ae","af","bd","be","bf","cd","ce","cf"], with: input("23"))
        testCase(expected: [], with: input(""))
        testCase(expected: ["a", "b", "c"], with: input("2"))
    }
}
