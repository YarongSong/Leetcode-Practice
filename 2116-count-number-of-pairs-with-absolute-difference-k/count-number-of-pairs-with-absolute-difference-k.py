class Solution:
    def countKDifference(self, nums: List[int], k: int) -> int:
        if len(nums) == 1:
            return 0
        
        s = {}
        cnt = 0
        for i in range(len(nums)):
            if (nums[i] - k) in s :
                cnt += s[nums[i] - k]

            if (nums[i] + k) in s:
                cnt += s[nums[i] + k]
            
            if nums[i] in s:
                s[nums[i]] += 1
            else:
                s[nums[i]] = 1

        return cnt


        