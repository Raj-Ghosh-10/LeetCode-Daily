/**
 * Definition for singly-linked list.
 * class ListNode {
 *     val: number
 *     next: ListNode | null
 *     constructor(val?: number, next?: ListNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.next = (next===undefined ? null : next)
 *     }
 * }
 */

function getDecimalValue(head: ListNode | null): number {
    let decimal: number[]=[], res: number=0, temp: ListNode | null=head;
    while(temp){
        decimal.push(temp.val);
        temp=temp.next;
    }
    let n: number=decimal.length;
    for(let i=0;i<n;i++) res+=decimal[i] * (1<<(n-i-1));
    return res;
};