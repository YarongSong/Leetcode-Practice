class Solution:
    def merge(self, nums1: List[int], m: int, nums2: List[int], n: int) -> None:
        """
        Do not return anything, modify nums1 in-place instead.
        """
        i = m - 1
        j = n - 1

        if n == 0:
            return
        elif m == 0:
            while j >= 0:
                nums1[j] = nums2[j]
                j -= 1
            return
        
        while i >=0 and j >=0:
            if nums1[i] >= nums2[j]:
                nums1[i+j+1] = nums1[i]
                i -= 1
            else:
                nums1[i+j+1] = nums2[j] 
                j -= 1

        while j >= 0:
            nums1[j] = nums2[j]
            j -= 1
        
        return

            

        