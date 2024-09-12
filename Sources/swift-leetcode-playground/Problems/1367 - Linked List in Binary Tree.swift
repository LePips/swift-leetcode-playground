//
// Linked List in Binary Tree
//
// Difficulty: Medium
// https://leetcode.com/problems/linked-list-in-binary-tree
//

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
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
struct LinkedListinBinaryTree {
    
    func s(_ head: ListNode?, _ root: TreeNode?) -> Bool {
        guard let head else { return true }
        guard let root else { return false }
        guard root.val == head.val else { return false }
        
        var t = false
        
        t = t || s(head.next, root.left)
        t = t || s(head.next, root.right)
        
        return t
    }
    
    func isSubPath(_ head: ListNode?, _ root: TreeNode?) -> Bool {
        guard let head else { return true }
        guard let root else { return false }
        
        var t = false
        
        if root.val == head.val {
            if s(head, root) {
                return true
            } else {
                t = t || isSubPath(head, root.left)
                t = t || isSubPath(head, root.right)
            }
        } else {
            t = t || isSubPath(head, root.left)
            t = t || isSubPath(head, root.right)
        }
        
		return t
    }
}

extension LinkedListinBinaryTree: Testable {

    var problemTitle: String {
        "1367 - Linked List in Binary Tree.swift"
    }

    func test() {

    }
}
