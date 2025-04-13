class Solution:
    def moveZeroes(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        p = 0
        while p < len(nums):
            if nums[p] != 0:
                p += 1
            else:
                q = p + 1
                while q < len(nums):
                    if nums[q] != 0:
                        nums[p] = nums[q]
                        nums[q] = 0
                        break
                    else:
                        q += 1
                if q == len(nums):
                    return
                p += 1
        