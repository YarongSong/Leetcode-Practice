class Solution:
    def majorityElement(self, nums: List[int]) -> int:
        s = {}
        for i in range(len(nums)):
            if nums[i] in s:
                s[nums[i]] += 1
            else:
                s[nums[i]] = 1

            if s[nums[i]] > len(nums)/2:
                return nums[i]
        
        #return res[0]

        