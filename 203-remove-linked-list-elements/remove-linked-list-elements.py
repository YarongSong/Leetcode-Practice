# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def removeElements(self, head: Optional[ListNode], val: int) -> Optional[ListNode]:
        dum = pre = ListNode()
        dum.next = head
        while head:
            if head.val == val:
                nxt = head.next
                pre.next = nxt
                head.next = None
                head = nxt
            else:
                head = head.next
                pre = pre.next
        return dum.next
        