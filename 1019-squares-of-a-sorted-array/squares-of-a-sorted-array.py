class Solution:
    def sortedSquares(self, nums: List[int]) -> List[int]:
        res = []
        for n in nums:
            res.append(pow(n,2))
        
        res.sort()
        return res
        