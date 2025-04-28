class Solution(object):
    def longestCommonPrefix(self, strs):
        """
        :type strs: List[str]
        :rtype: str

        1) len(strs) == 1: ""
        2) len(strs) > 1, len(strs[i]) == 0: ""
        """

        if len(strs) == 1:
            return strs[0]

        res = []
        min_len = float('inf')

        for i in range(len(strs)):
            min_len = min(len(strs[i]), min_len)
        
        i = 0
        j = 0
        while i < min_len:
            while j < len(strs):
                if strs[j][i] != strs[0][i]:
                    break
                else:
                    j += 1
            if j == len(strs):
                res.append(strs[0][i])
                i += 1
                j = 0
            else:
                break
        
        return "".join(res)
        
        
        