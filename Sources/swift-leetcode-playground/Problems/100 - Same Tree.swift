//
// Same Tree
//
// Difficulty: Easy
// https://leetcode.com/problems/same-tree
//

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
struct SameTree {
    func input(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        
        if p == nil && q == nil {
            return true
        }
        
        if p?.val != q?.val {
            return false
        }

        return input(p?.left, q?.left) && input(p?.right, q?.right)
    }
}

extension SameTree: Testable {

    var problemTitle: String {
        "100 - Same Tree.swift"
    }

    func test() {
        testCase(expected: true) {
            let a = TreeNode(1)
            let b = TreeNode(2)
            let c = TreeNode(3)
            a.left = b
            a.right = c
            
            return input(a, a)
        }
    }
}
