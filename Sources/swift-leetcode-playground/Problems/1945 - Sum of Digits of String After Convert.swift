//
// Sum of Digits of String After Convert
//
// Difficulty: Easy
// https://leetcode.com/problems/sum-of-digits-of-string-after-convert
//

struct SumofDigitsofStringAfterConvert {
    
    func f(_ s: String) -> String {
        let t = s.compactMap(\.asciiValue)
            .map { $0 - 48 }
            .map(Int.init)
            .reduce(0, +)
        
        return String(t)
    }
    
    func input(_ s: String, _ k: Int) -> Int {
        let i = s.compactMap(\.asciiValue)
            .map { $0 - 96 }
            .map(String.init)
            .joined()
        
        var j = f(i)
        
        for _ in 0 ..< k - 1 {
            j = f(j)
        }
        
        return Int(j)!
    }
}

extension SumofDigitsofStringAfterConvert: Testable {

    var problemTitle: String {
        "1945 - Sum of Digits of String After Convert.swift"
    }

    func test() {
        testCase(expected: 36, with: input("iiii", 1))
        testCase(expected: 6, with: input("leetcode", 2))
        testCase(expected: 0, with: input("hwmqsaqvrliksiobdtbtxiztnextxsvpoqeyfvxlnrcwlaqh", 9))
    }
}
