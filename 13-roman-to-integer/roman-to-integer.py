class Solution:
    def romanToInt(self, s: str) -> int:
        d = {"I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000}
        if len(s) == 1:
            return d[s[0]]
        
        i = 0
        j = 1
        res = 0
        while i <= len(s) - 1:
            if j > len(s) - 1:
                res += d[s[i]]
                i += 1
            elif d[s[i]] >= d[s[j]]:
                res += d[s[i]]
                i += 1
                j += 1
            else:
                res += d[s[j]] - d[s[i]]
                i += 2
                j += 2

        return res
            

        
        



        