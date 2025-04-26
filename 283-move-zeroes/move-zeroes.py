class Solution(object):
    def moveZeroes(self, nums):
        """
        :type nums: List[int]
        :rtype: None Do not return anything, modify nums in-place instead.
        """

        i = 0
        j = 0
        while j < len(nums):
            if nums[i] == 0 and nums[j] == 0:
                j += 1 
            elif nums[i] == 0:
                nums[i] = nums[j]
                nums[j] = 0
                i += 1
                j += 1
            elif nums[i] != 0:
                i += 1
                j += 1

        return nums
        