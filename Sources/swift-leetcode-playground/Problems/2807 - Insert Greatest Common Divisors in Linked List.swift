//
// Insert Greatest Common Divisors in Linked List
//
// Difficulty: Medium
// https://leetcode.com/problems/insert-greatest-common-divisors-in-linked-list
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
struct InsertGreatestCommonDivisorsinLinkedList {
    
    func gcd(_ a: Int, _ b: Int) -> Int {
        let r = a % b
        if r != 0 {
            return gcd(b, r)
        } else {
            return b
        }
    }
    
    func input(_ head: ListNode?) -> ListNode? {
        guard let head, let next = head.next else { return head }
        
        let x = head.val
        let y = next.val
        let new = ListNode(gcd(x, y), next)
        
        head.next = new
        new.next = input(next)
        
        return head
    }
}

extension InsertGreatestCommonDivisorsinLinkedList: Testable {

    var problemTitle: String {
        "2807 - Insert Greatest Common Divisors in Linked List.swift"
    }

    func test() {

    }
}
