class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        if len(s) != len(t):
            return False
        
        dic1 = {}
        dic2 = {}
        for n1 in s:
            if n1 in dic1:
                dic1[n1] += 1
            else:
                dic1[n1] = 1
        
        for n2 in t:
            if n2 in dic2:
                dic2[n2] += 1
            else:
                dic2[n2] = 1

        return dic1 == dic2


        