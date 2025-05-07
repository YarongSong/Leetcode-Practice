class Solution:
    def lengthOfLastWord(self, s: str) -> int:
        if len(s) == 1:
            return len(s)

        lst = s.split(" ")
        res = 0
        print(lst)
        for n in lst:
            if n == "":
                continue
            else:
                res = len(n)
        

        return res

        