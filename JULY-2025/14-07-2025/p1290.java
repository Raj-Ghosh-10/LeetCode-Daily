/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode() {}
 *     ListNode(int val) { this.val = val; }
 *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 * }
 */
class Solution {
    public int getDecimalValue(ListNode head)
    {
        int out = 0;
        int count = 0;
        ListNode og = head;
        // if (head == null)
        //     return 0;
        while(head.next != null)
        {
            count++;
            head = head.next;
        }    

        while(og != null)
        {
            if(og.val == 1)
            {
                out += Math.pow(2,count);
            }
            count--;
            og = og.next;
        }
        return out;
    }
}