class Solution:
    def containsDuplicate(self, nums: List[int]) -> bool:
        if len(nums) <= 1:
            return False

        s = set()
        for n in nums:
            if n not in s:
                s.add(n)
            else:
                return True
        
        return False

        