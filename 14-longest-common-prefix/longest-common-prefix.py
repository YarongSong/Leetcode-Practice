class Solution(object):
    def longestCommonPrefix(self, strs):
        """
        :type strs: List[str]
        :rtype: str
        """

        if len(strs) <= 1:
            return strs[0]
        
        res = []

        l = float('inf')
        for s in strs:
            l = min(len(s), l)
        

        i = 0
        j = 1
        while i <= l - 1:
            while j <= len(strs) - 1:
                if strs[j][i] != strs[0][i]:
                    break
                else:
                    j += 1
            if j == len(strs):
                res.append(strs[0][i])
                i += 1
                j = 1
            else:
                break
        
        return "".join(res)

            

        

        