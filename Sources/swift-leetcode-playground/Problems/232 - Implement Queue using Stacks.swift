//
// Implement Queue using Stacks
//
// Difficulty: Easy
// https://leetcode.com/problems/implement-queue-using-stacks
//

class MyQueue {
    
    private var s1: [Int] = []
    private var s2: [Int] = []

    init() {
        
    }
    
    func push(_ x: Int) {
        
        while !s2.isEmpty {
            s1.append(s2.removeLast())
        }

        s1.append(x)

        while !s1.isEmpty {
            s2.append(s1.removeLast())
        }
    }
    
    func pop() -> Int {
        s2.removeLast()
    }
    
    func peek() -> Int {
        s2.last!
    }
    
    func empty() -> Bool {
        s2.isEmpty
    }
}
/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */

struct ImplementQueueusingStacks {}

extension ImplementQueueusingStacks: Testable {

    var problemTitle: String {
        "232 - Implement Queue using Stacks.swift"
    }

    func test() {
        let q = MyQueue()
        q.push(1)
        
        testCase(expected: 1, with: q.peek)
    }
}
