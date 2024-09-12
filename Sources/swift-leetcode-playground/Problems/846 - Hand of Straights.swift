//
// Hand of Straights
//
// Difficulty: Medium
// https://leetcode.com/problems/hand-of-straights
//

struct HandofStraights {
    
    func f(_ hand: [Int], groupSize: Int) -> [Int]? {
        guard !hand.isEmpty else { return [] }
        
        var hand = hand
        var c = hand.removeFirst()
        var t: [Int] = [c]
        
        while t.count < groupSize {
            if let ni = hand.firstIndex(where: { $0 == c + 1 }) {
                c = hand.remove(at: ni)
                t.append(c)
            } else {
                return nil
            }
        }
        
        return hand
    }
    
    func input(_ hand: [Int], _ groupSize: Int) -> Bool {
        guard hand.count % groupSize == 0 else { return false }
        
        var hand = hand.sorted()
        let n = hand.count / groupSize
        
        for _ in 0 ..< n {
            if let newHand = f(hand, groupSize: groupSize) {
                hand = newHand
            } else {
                return false
            }
        }

        return hand.isEmpty
    }
}

extension HandofStraights: Testable {

    var problemTitle: String {
        "846 - Hand of Straights.swift"
    }

    func test() {
        testCase(expected: true, with: input([1,2,3,6,2,3,4,7,8], 3))
        testCase(expected: false, with: input([1,2,3,4,5], 4))
        testCase(expected: false, with: input([1,1,2,2,3,3], 2))
        testCase(expected: true, with: input([1,2,3,4,5,6], 2))
    }
}
