# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, x):
#         self.val = x
#         self.next = None

# ListNode can be save in hashset
# node 1 and node are 2 nodes although their values and next node are the same
class Solution:
    def getIntersectionNode(self, headA: ListNode, headB: ListNode) -> Optional[ListNode]:
        l1 = 0
        cur = headA
        while cur:
            l1 += 1
            cur = cur.next
        
        l2 = 0
        cur = headB
        while cur:
            l2 += 1
            cur = cur.next

        while headA and headB:
            if l1 < l2:
                headB = headB.next
                l2 -= 1
            elif l1 > l2:
                headA = headA.next
                l1 -= 1
            else:
                if headA == headB:
                    return headA
                else:
                    headA = headA.next
                    headB = headB.next
        return None












        # s = set()
        # while headA:
        #     s.add(headA)
        #     headA = headA.next
        # while headB:
        #     if headB in s:
        #         return headB
        #     else:
        #         headB = headB.next
        # return None

        