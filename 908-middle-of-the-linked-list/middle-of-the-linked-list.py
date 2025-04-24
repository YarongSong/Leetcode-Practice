# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def middleNode(self, head: Optional[ListNode]) -> Optional[ListNode]:
        if head.next is None:
            return head
        elif head.next.next is None:
            return head.next

        s = head
        f = head
        while f.next is not None and f.next.next is not None:
            s = s.next
            f = f.next.next
        
        if f.next is not None:
            s = s.next
        
        return s


        