class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        d1 = {}
        d2 = {}
        for c1 in s:
            if c1 in d1:
                d1[c1] += 1
            else:
                d1[c1] = 1
        
        for c2 in t:
            if c2 in d2:
                d2[c2] += 1
            else:
                d2[c2] = 1
        
        return d1 == d2
        