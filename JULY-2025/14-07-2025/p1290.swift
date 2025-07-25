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

class Solution {
    func getDecimalValue(_ head: ListNode?) -> Int {
        var ans = 0
        var node = head

        while let curr = node {
            ans = ans * 2 + curr.val
            node = curr.next
        }

        return ans
    }
}