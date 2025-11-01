class Solution:
    def modifiedList(self, nums: List[int], head: Optional[ListNode]) -> Optional[ListNode]:
        prev=head
        sety=set(nums)
        while head.val in sety:
            head=head.next
        prev=head
        temp=head
        if head.next:
            head=head.next
            while head:
                if head.val not in sety:
                    prev.next=head
                    prev=head
                head=head.next
            if prev.next and  prev.next.val in sety:
                prev.next=None
        return temp   