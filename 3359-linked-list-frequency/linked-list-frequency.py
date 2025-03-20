# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def frequenciesOfElements(self, head: Optional[ListNode]) -> Optional[ListNode]:
        d = {}
        while head:
            if head.val in d:
                d[head.val] += 1
            else:
                d[head.val] = 1
            head = head.next
        
        dummy = head = ListNode()
        for key, val in d.items():
            cur = ListNode(val)
            head.next = cur
            head = cur

        return dummy.next 
        