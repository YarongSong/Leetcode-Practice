class Solution:
    def majorityElement(self, nums: List[int]) -> int:
        l = len(nums)
        d = {}
        for n in nums:
            if n in d:
                d[n] += 1
            else:
                d[n] = 1
        
        
        for n in d:
            if d[n] > l/2:
                return n
        
    
        