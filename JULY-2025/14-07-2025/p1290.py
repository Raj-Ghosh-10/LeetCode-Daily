# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def getDecimalValue(self, head: Optional[ListNode]) -> int:
        temp = head
        l = []
        while temp:
            l.append(temp.val)
            temp = temp.next

        print(l)
        a = 0
        ans = 0
        for i in range(len(l)-1, -1, -1):
            curr = l[i]*(2**a)
            ans+=curr
            a +=1

        return ans