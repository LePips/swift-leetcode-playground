//
// Delete Nodes From Linked List Present in Array
//
// Difficulty: Medium
// https://leetcode.com/problems/delete-nodes-from-linked-list-present-in-array
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
struct DeleteNodesFromLinkedListPresentinArray {
    
    func snip(_ head: ListNode?) {
        
    }
    
    func input(_ nums: [Int], _ head: ListNode?) -> ListNode? {
        
        let nums = Set(nums)
        let dummy = ListNode(-1)
        dummy.next = head
        
        var h: ListNode? = dummy
        
        while let ph = h {
            if nums.contains(ph.next?.val ?? -1) {
                ph.next = ph.next?.next
            } else {
                h = ph.next
            }
        }
        
        return head
    }
}

extension DeleteNodesFromLinkedListPresentinArray: Testable {

    var problemTitle: String {
        "3217 - Delete Nodes From Linked List Present in Array.swift"
    }

    func test() {

    }
}
