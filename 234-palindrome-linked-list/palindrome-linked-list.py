# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def isPalindrome(self, head: Optional[ListNode]) -> bool:
        l = []
        while head:
            l.append(head.val)
            head = head.next
        
        p = 0
        q = len(l) - 1
        while p <= q:
            if l[p] == l[q]:
                p += 1
                q -= 1
            else:
                return False
        return True
        