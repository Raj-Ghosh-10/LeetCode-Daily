/**
 * Example:
 * var li = ListNode(5)
 * var v = li.`val`
 * Definition for singly-linked list.
 * class ListNode(var `val`: Int) {
 *     var next: ListNode? = null
 * }
 */
class Solution {
    fun getDecimalValue(head: ListNode?): Int {
        var binaryPresent = ""
        var head = head

        while (head != null) {
            binaryPresent += head.`val`.toString()
            head = head?.next
        }

        return binaryPresent.toInt(2)
    }
}