# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution(object):
    def isPalindrome(self, head):
        """
        :type head: Optional[ListNode]
        :rtype: bool
        """
        if head.next is None:
            return True
        if head.next.next is None and head.val == head.next.val:
            return True
        elif head.next.next is None:
            return False

        
        s = f = head
        while f.next and f.next.next:
            s = s.next
            f = f.next.next
        
        head2 = s.next

        cur = None
        while head2:
            nxt = head2.next
            head2.next = cur
            cur = head2
            head2 = nxt
        
        while head and cur:
            if head.val == cur.val:
                head =  head.next
                cur = cur.next
            else:
                return False
        
        return True




        