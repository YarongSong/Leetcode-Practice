class Solution:
    def majorityElement(self, nums: List[int]) -> int:
        l = len(nums)
        d = {}
        for n in nums:
            if n in d:
                d[n] += 1
            else:
                d[n] = 1
        
        for k, v in d.items():
            if v > l/2:
                return k
        