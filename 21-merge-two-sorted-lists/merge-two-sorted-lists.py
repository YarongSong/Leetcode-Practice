# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def mergeTwoLists(self, list1: Optional[ListNode], list2: Optional[ListNode]) -> Optional[ListNode]:
        cur = ListNode()
        dum = ListNode()
        if list1 and list2 and list1.val <= list2.val:
            dum.next = list1
        elif list1 and list2 and list1.val > list2.val:
            dum.next = list2
        elif list1:
            return list1
        else:
            return list2

        while list1 and list2:
            if list1.val <= list2.val:
                cur.next = list1
                print(cur.val)
                cur = list1
                print(cur.val)
                list1 = list1.next
            else: 
                cur.next = list2
                cur = list2
                list2 = list2.next
        
        if list1:
            cur.next = list1
        elif list2:
            cur.next = list2
        
        return dum.next