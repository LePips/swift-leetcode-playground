//
// Integer to English Words
//
// Difficulty: Hard
// https://leetcode.com/problems/integer-to-english-words
//

import Algorithms

struct IntegertoEnglishWords {
    
    func nToW(_ n: String) -> String {
        switch n {
        case "1": "One"
        case "2": "Two"
        case "3": "Three"
        case "4": "Four"
        case "5": "Five"
        case "6": "Six"
        case "7": "Seven"
        case "8": "Eight"
        case "9": "Nine"
        case "10": "Ten"
        case "11": "Eleven"
        case "12": "Twelve"
        case "13": "Thirteen"
        case "14": "Fourteen"
        case "15": "Fifteen"
        case "16": "Sixteen"
        case "17": "Seventeen"
        case "18": "Eighteen"
        case "19": "Nineteen"
        case "20": "Twenty"
        case "30": "Thirty"
        case "40": "Forty"
        case "50": "Fifty"
        case "60": "Sixty"
        case "70": "Seventy"
        case "80": "Eighty"
        case "90": "Ninety"
        default: ""
        }
    }
    
    func f(_ w: [String], _ l: String) -> String {
        
        func d(_ w: [String]) -> String {
            if w[0] == "0" {
                return nToW(w[1])
            } else {
                return nToW(w[0] + "0") + " " + nToW(w[1])
            }
        }
        
        var t: String
        
        switch w.count {
        case 1:
            t = nToW(w[0])
        case 2:
            if w[0] == "1" {
                t = nToW(w[0] + w[1])
            } else {
                t = d(w)
            }
        case 3:
            var tt = ""
            
            if w[0] != "0" {
                tt += nToW(w[0]) + " Hundred "
            }
            
            tt += f(Array(w[1...]), "")
            
            t = tt
        default:
            fatalError()
        }
        
        t = t.trimmingCharacters(in: .whitespaces)
        
        let suffix = {
            if w.allSatisfy({ $0 == "0" }) || l.isEmpty {
                return ""
            } else {
                return " " + l
            }
        }()
        
        return t + suffix
    }
    
    func input(_ num: Int) -> String {
        
        guard num > 0 else { return "Zero" }
        
        let s = Array(String(num))
        
        let bins = [
            "",
            "Thousand",
            "Million",
            "Billion"
        ]
        
        let chunks = s.reversed()
            .chunks(ofCount: 3)
            .map { $0.reversed() }
            .map { Array($0) }
            .map { $0.map { i in String(i) }}
        
        let a = zip(chunks, bins)
            .map {
                f($0, $1)
            }
            .map {
                $0.trimmingCharacters(in: .whitespacesAndNewlines)
            }
            .filter { !$0.isEmpty }
        
        let b = a.reversed()
            .joined(separator: " ")
        
        return b
    }
}

extension IntegertoEnglishWords: Testable {

    var problemTitle: String {
        "273 - Integer to English Words.swift"
    }

    func test() {
        testCase(expected: "One Thousand One", with: input(1001))
        testCase(expected: "One Thousand", with: input(1000))
        testCase(expected: "One Hundred Twenty Three", with: input(123))
        testCase(expected: "Twelve Thousand Three Hundred Forty Five", with: input(12345))
        testCase(expected: "One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven", with: input(1234567))
        testCase(expected: "Thirteen", with: input(13))
        testCase(expected: "Zero", with: input(0))
        testCase(expected: "One", with: input(1))
        testCase(expected: "Two", with: input(2))
        testCase(expected: "Three", with: input(3))
        testCase(expected: "Four", with: input(4))
        testCase(expected: "Twenty", with: input(20))
        testCase(expected: "One Hundred Eleven", with: input(111))
        testCase(expected: "Fifty Thousand Eight Hundred Sixty Eight", with: input(50868))
        testCase(expected: "One Million", with: input(1000000))
    }
}
