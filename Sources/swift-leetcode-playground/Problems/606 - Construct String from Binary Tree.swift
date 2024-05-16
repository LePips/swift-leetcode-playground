//
// Construct String from Binary Tree
//
// Difficulty: Easy
// https://leetcode.com/problems/construct-string-from-binary-tree
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
struct ConstructStringfromBinaryTree {
    func input(_ root: TreeNode?) -> String {
        guard let root = root else { return "" }

        var t = ""
        var a = ""
        var b = ""

        t += "\(root.val)"

        if let r = root.right {
            b = input(r)

            if b != "" {
                b = "(\(b))"
            }
        }

        if let l = root.left {
            a = input(l)

            if a != "" {
                a = "(\(a))"
            }
        } else if b != "" {
            a = "()"
        }

        t += a
        t += b

        return t
    }
}

extension ConstructStringfromBinaryTree: Testable {

    var problemTitle: String {
        "606 - Construct String from Binary Tree.swift"
    }

    func test() {
        var four = TreeNode(4)
        var three = TreeNode(3)
        var two = TreeNode(2, four, nil)
        var one = TreeNode(1, two, three)
        
        testCase(expected: "1(2(4))(3)", with: input(one))
        
        four = TreeNode(4)
        three = TreeNode(3)
        two = TreeNode(2, nil, four)
        one = TreeNode(1, two, three)
        
        testCase(expected: "1(2()(4))(3)", with: input(one))
    }
}
