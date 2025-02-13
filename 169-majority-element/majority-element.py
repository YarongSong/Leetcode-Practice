class Solution:
    def majorityElement(self, nums: List[int]) -> int:
        s = {}
        res = []
        for i in range(len(nums)):
            if nums[i] in s:
                s[nums[i]] += 1
            else:
                s[nums[i]] = 1

            if s[nums[i]] > len(nums)/2:
                res.append(nums[i])
        
        return res[0]

        