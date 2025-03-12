# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def deleteDuplicates(self, head: Optional[ListNode]) -> Optional[ListNode]:
        s = set()
        cur = head
        pre = ListNode()
        pre.next = head
        while cur:
            if cur.val not in s:
                s.add(cur.val)
                cur = cur.next
                pre = pre.next
            else:
                nxt = cur.next
                pre.next = nxt
                # cur.next = None
                cur = nxt
        return head
                
        