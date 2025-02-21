class Solution:
    def isHappy(self, n: int) -> bool:
        total = 0
        already_in = set()
        while n not in already_in:
            already_in.add(n)
            s = str(n)
            total = 0
            for i in s:
                total += int(i) * int(i)
            if total == 1:
                return True
            else: 
                n = total
        return False
        