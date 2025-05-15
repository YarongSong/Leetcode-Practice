class Solution:
    def climbStairs(self, n: int) -> int:
        if n == 1:
            return 1
        elif n == 2:
            return 2
        
        s1 = 1
        s2 = 2
        i = 3
        res = 0
        while i <= n:
            res = s1 + s2
            s1 = s2
            s2 = res
            i += 1
        
        return res



        