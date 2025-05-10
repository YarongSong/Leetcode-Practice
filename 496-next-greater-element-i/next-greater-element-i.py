class Solution:
    def nextGreaterElement(self, nums1: List[int], nums2: List[int]) -> List[int]:
        res = []
        i = 0
        j = 0
        found = False 
        while i < len(nums1):
            while j < len(nums2):
                if nums2[j] == nums1[i]:
                    j += 1
                    found = True
                elif found and nums2[j] > nums1[i]:
                    res.append(nums2[j])
                    break
                else:
                    j += 1
               
            if j == len(nums2):
                res.append(-1)
            i += 1
            j = 0
            found = False

        return res

        