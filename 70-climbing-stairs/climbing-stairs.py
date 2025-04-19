class Solution:
    def climbStairs(self, n: int) -> int:
        if n == 1:
            return 1
        elif n == 2:
            return 2

        a = 1
        b = 2
        i = 3
        res = 0
        while i <= n:
            res = a + b
            a = b
            b = res
            i += 1
        
        return res
        

        
        