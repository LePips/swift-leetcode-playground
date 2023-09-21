//
// Remove Duplicates from Sorted List
//
// Difficulty: Easy
// https://leetcode.com/problems/remove-duplicates-from-sorted-list
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
struct RemoveDuplicatesfromSortedList {
    func input(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }

        var current: ListNode? = head
        var a: ListNode? = head.next

        while let _ = a {
            if current?.val != a?.val {
                current?.next = a
                current = a
                a = a?.next
            } else {
                a = a?.next
            }
        }
        
        current?.next = nil

        return head
    }
}

extension RemoveDuplicatesfromSortedList: Testable {

    var problemTitle: String {
        "83 - Remove Duplicates from Sorted List.swift"
    }

    func test() {
        testCase(expected: "[1,2]") {
            let c = ListNode(2)
            let b = ListNode(1, c)
            let a = ListNode(1, b)
            
            print(a.outputChain())
            
            let z = input(a)
            
            return z?.outputChain() ?? ""
        }
        
        testCase(expected: "[1,2,3]]") {
            ListNode.makeChain([1,1,2,3,3])?.outputChain() ?? ""
        }
    }
}
