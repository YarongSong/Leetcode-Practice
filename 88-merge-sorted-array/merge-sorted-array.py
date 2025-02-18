class Solution:
    def merge(self, nums1: List[int], m: int, nums2: List[int], n: int) -> None:
        """
        Do not return anything, modify nums1 in-place instead.
        """

        if n == 0:
            return nums1

        i = m
        j = 0
        while i < m + n:
            nums1[i] = nums2[j]
            i += 1
            j += 1

        nums1.sort() 


        
        # i = 0
        # j = 0
        # while (i < len(nums1) - 1) and j < (len(nums2) - 1):
        #     s = nums1[i]
        #     if s <= nums2[j]:
        #         nums1[i] = s
        #         i += 1
        #     elif s > nums2[j]:
        #         nums1[i] = nums2[j]
        #         i += 1
        #         j += 1



        