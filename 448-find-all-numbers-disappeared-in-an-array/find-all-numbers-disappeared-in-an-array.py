class Solution:
    def findDisappearedNumbers(self, nums: List[int]) -> List[int]:
        l = len(nums)
        res = []
        nums_set = set(nums)
        
        n = 1
        while n <= l:
            if n not in nums_set:
                res.append(n)
            n += 1
        
        return res

        