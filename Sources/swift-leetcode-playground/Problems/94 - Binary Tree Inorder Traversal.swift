//
// Binary Tree Inorder Traversal
//
// Difficulty: Easy
// https://leetcode.com/problems/binary-tree-inorder-traversal
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
struct BinaryTreeInorderTraversal {
    
    func input(_ root: TreeNode?) -> [Int] {
        guard let root else { return [] }
        return input(root.left) + [root.val] + input(root.right)
    }
}

extension BinaryTreeInorderTraversal: Testable {

    var problemTitle: String {
        "94 - Binary Tree Inorder Traversal.swift"
    }

    func test() {
        
    }
}
