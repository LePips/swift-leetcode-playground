//
// Number of Steps to Reduce a Number in Binary Representation to One
//
// Difficulty: Medium
// https://leetcode.com/problems/number-of-steps-to-reduce-a-number-in-binary-representation-to-one
//

struct NumberofStepstoReduceaNumberinBinaryRepresentationtoOne {
    
    func increment(_ s: String) -> String {
        var s = Array(s)

        if s.last == "0" {
            s[s.count - 1] = "1"
        } else {
            var i = s.count - 1
            var r = false

            while i >= 0 {
                if s[i] == "0" {
                    s[i] = "1"
                    r = true
                    break
                } else {
                    s[i] = "0"
                    i -= 1
                }
            }
            
            if !r {
                s = ["1"] + s
            }
        }

        return String(s)
    }
    
    func isOne(_ s: String) -> Bool {
        s.filter { $0 == "1" }.count == 1 && s.last == "1"
    }

    func input(_ s: String) -> Int {
        var s = s
        var t = 0

        while !isOne(s) {
            
            t += 1

            if s.last == "1" {
                s = increment(s)
            } else {
                s.removeLast()
            }
        }

        return t
    }
}

extension NumberofStepstoReduceaNumberinBinaryRepresentationtoOne: Testable {

    var problemTitle: String {
        "1404 - Number of Steps to Reduce a Number in Binary Representation to One.swift"
    }

    func test() {
        testCase(expected: 6, with: input("1101"))
        testCase(expected: 1, with: input("10"))
        testCase(expected: 0, with: input("1"))
        testCase(expected: 89, with: input("1111110011101010110011100100101110010100101110111010111110110010"))
    }
}
