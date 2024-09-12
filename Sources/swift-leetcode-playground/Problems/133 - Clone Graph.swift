//
// Clone Graph
//
// Difficulty: Medium
// https://leetcode.com/problems/clone-graph
//

/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var neighbors: [Node?]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.neighbors = []
 *     }
 * }
 */
struct CloneGraph {
    
    func f(_ node: Node?, _ g: inout [Int: Node]) -> Node? {
        guard let node else { return nil }
        
        if let n = g[node.val] { return n }
        
        let n = Node(node.val)
        g[node.val] = n
        
        for neighbor in node.neighbors {
            n.neighbors.append(f(neighbor, &g))
        }
        
        return n
    }
    
    func input(_ node: Node?) -> Node? {
        guard let node else { return nil }
        var g: [Int: Node] = [:]
        
        return f(node, &g)
    }
}

extension CloneGraph: Testable {

    var problemTitle: String {
        "133 - Clone Graph.swift"
    }

    func test() {

    }
}
