# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {Integer}
def get_decimal_value(head)
    num = 0
    i = 0
    stack = []
    while head != nil
        stack.push(head.val)
        head = head.next
    end
    while !stack.empty?
        num = num + stack.pop * 2**i
        i += 1
    end
    num 
end