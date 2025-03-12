# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def deleteNodes(self, head: Optional[ListNode], m: int, n: int) -> Optional[ListNode]:
        k = m
        r = n
        cur = head
        while cur:
          if k > 0 and r == n:
            k -= 1
            if k == 0:
                last = cur
            print(k,r)
            print(cur.val)
            cur = cur.next           
          elif k == 0 and r > 0: 
            r -= 1
            print(k,r)
            if r == 0 or cur.next is None:
                nxt = cur.next
                last.next = nxt               
            cur = cur.next
          elif k == 0 and r == 0:
            k = m
            r = n
            print(k,r)
            print(cur.val)
        
        return head
                 
        
        