class Solution:
    def countSubarrays(self, nums: List[int]) -> int:
        i = 0
        res = 0
        while i <= len(nums) - 3:
            if nums[i] + nums[i+2] == 0.5 * nums[i+1]:
                res += 1
            i += 1
        
        return res


        