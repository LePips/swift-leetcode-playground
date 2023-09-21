//
// Happy Number
//
// Difficulty: Easy
// https://leetcode.com/problems/happy-number
//

struct HappyNumber {
    
    func f(_ n: Int) -> Int {
        String(n)
            .map { $0.wholeNumberValue! * $0.wholeNumberValue! }
            .reduce(0, +)
    }
    
    func input(_ n: Int) -> Bool {
        
        var t = n
        var h = n
        
        while true {
            t = f(t)
            h = f(f(h))
            
            if t == h {
                break
            }
        }
        
        return t == 1
    }
}

extension HappyNumber: Testable {

    var problemTitle: String {
        "202 - Happy Number.swift"
    }

    func test() {
        
    }
}
