class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        if len(strs) == 1:
            return strs[0]

        min_len = float('inf')
        for s in strs:
            min_len = min(len(s), min_len)
            
        print(min_len)
        
        i = 0
        res = []
        while i < min_len:
            j = 1
            while j < len(strs):
                if strs[j][i] != strs[0][i]:
                    break
                else:
                    j += 1
            if j == len(strs):
                res.append(strs[0][i])
                i += 1
            else:
                break
        
        return "".join(res)



        