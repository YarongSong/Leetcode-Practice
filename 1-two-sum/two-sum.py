class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        if len(nums) < 2:
            return -1

        d = {}
        for i in range(len(nums)):
            if target - nums[i] in d:
                return (d[target - nums[i]], i)
            else:
                d[nums[i]] = i



        
        # i = 0

        # while i < len(nums) - 1:
        #     j = i + 1
        #     while j < len(nums):
        #         if nums[i] + nums[j] == target:
        #             return (i,j)
        #         else:
        #             j += 1
        #     i += 1

        