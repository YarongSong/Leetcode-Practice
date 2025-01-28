class Solution:
    def removeElement(self, nums: List[int], val: int) -> int:
        if len(nums) == 0:
            return 0
        elif len(nums) == 1 and nums[0] == val:
            return 0
        elif len(nums) == 1 and nums[0] != val:
            return 1
        
        i = 0
        j = 0
        while j < len(nums):
            if nums[j] == val:
                j += 1
            else:
                nums[i] = nums[j]
                i += 1
                j += 1
        return i
                


            
        