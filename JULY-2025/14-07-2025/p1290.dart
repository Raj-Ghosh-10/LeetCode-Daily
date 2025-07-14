/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  int getDecimalValue(ListNode? head) {
  ListNode? current=head;
  String str='';
  while(current!=null){
   str+=current.val.toString();
   current=current.next;
  }
  return int.parse(str,radix:2);
  }
}