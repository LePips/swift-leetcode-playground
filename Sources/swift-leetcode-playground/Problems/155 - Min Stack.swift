//
// Min Stack
//
// Difficulty: Medium
// https://leetcode.com/problems/min-stack
//

class MinStack {
    
    class Node {
        var previous: Node?
        var min: Int
        var value: Int
        
        init(previous: Node? = nil, min: Int, value: Int) {
            self.previous = previous
            self.min = min
            self.value = value
        }
    }
    
    private var _top: Node
    
    init() {
        _top = .init(min: Int.max, value: Int.max)
    }
    
    func push(_ val: Int) {
        
        let min = min(_top.min, val)
        let newNode = Node(previous: _top, min: min, value: val)
        
        _top = newNode
    }
    
    func pop() {
        _top = _top.previous!
    }
    
    func top() -> Int {
        _top.value
    }
    
    func getMin() -> Int {
        _top.min
    }
}
/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */

extension MinStack: Testable {

    var problemTitle: String {
        "155 - Min Stack.swift"
    }

    func test() {

    }
}
