# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def mergeTwoLists(self, list1: Optional[ListNode], list2: Optional[ListNode]) -> Optional[ListNode]:
        if list1 is None:
            return list2
        elif list2 is None:
            return list1
        elif list1.val <= list2.val:
            list1.next = self.mergeTwoLists(list1.next,list2)
            return list1
        else:
            list2.next = self.mergeTwoLists(list1,list2.next)
            return list2
        
        # cur = ListNode()
        # dum = ListNode()
        # if list1 and list2 and list1.val <= list2.val:
        #     dum.next = list1
        # elif list1 and list2 and list1.val > list2.val:
        #     dum.next = list2
        # elif list1:
        #     return list1
        # else:
        #     return list2

        # while list1 and list2:
        #     if list1.val <= list2.val:
        #         cur.next = list1
        #         cur = list1
        #         list1 = list1.next
        #     else: 
        #         cur.next = list2
        #         cur = list2
        #         list2 = list2.next
        
        # if list1:
        #     cur.next = list1
        # elif list2:
        #     cur.next = list2
        
        # return dum.next