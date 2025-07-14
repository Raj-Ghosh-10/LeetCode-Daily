/**
 * Definition for singly-linked list.
 * class ListNode(_x: Int = 0, _next: ListNode = null) {
 *   var next: ListNode = _next
 *   var x: Int = _x
 * }
 */
object Solution {
    def getDecimalValue(head: ListNode, result: Int = 0): Int = {
        head match
            case null => result
            case _ => getDecimalValue(head.next, 2 * result + head.x)
    }
}