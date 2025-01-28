class Solution:
    def removeDuplicates(self, nums: List[int]) -> int:
        if len(nums) < 0:
            return 0
        elif len(nums) == 1:
            return 1

        i = 0
        j = 1
        while j < len(nums):
            if nums[j] == nums[i]:
                j += 1
            elif nums[j] > nums[i]:
                i += 1
                nums[i] = nums[j]
                j += 1
        return i + 1
        
        