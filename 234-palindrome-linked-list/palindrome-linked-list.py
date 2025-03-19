# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def isPalindrome(self, head: Optional[ListNode]) -> bool:
        cnt = 0
        cur = head
        while cur:
            cnt += 1
            cur = cur.next
        
        half = cnt // 2
        cur = head
        pre = ListNode()
        pre.next = cur
        while cur and half > 0:
            half -= 1
            pre = cur
            cur = cur.next   # the head of the second half before reverse
        pre.next = None

        pre = None
        while cur:
            nxt = cur.next
            cur.next = pre
            pre = cur # the head of the second half after reverse
            cur = nxt

        
        while head and pre:
            if head.val == pre.val:
                head = head.next
                pre = pre.next
            else: 
                return False
        
        return True













        # l = []
        # while head:
        #     l.append(head.val)
        #     head = head.next
        
        # p = 0
        # q = len(l) - 1
        # while p <= q:
        #     if l[p] == l[q]:
        #         p += 1
        #         q -= 1
        #     else:
        #         return False
        # return True
        