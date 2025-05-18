class Solution:
    def lengthOfLastWord(self, s: str) -> int:
        lst = s.split(" ")
        i = len(lst) - 1
        res = 0
        while i >= 0 and res == 0:
            res = len(lst[i])
            i -= 1
        
        return res


        