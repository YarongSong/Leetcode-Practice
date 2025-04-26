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
            
        lst = []
        while head:
            lst.append(head.val)
            head = head.next
        
        i = 0
        j = len(lst) - 1
        while i <= j:
            if lst[i] == lst[j]:
                i += 1
                j -= 1
            else:
                return False
        
        return True

        