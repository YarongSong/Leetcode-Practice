class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        m = len(strs)
        l = len(strs[0])
        for i in range(m):
            if len(strs[i]) < l:
                l = len(strs[i])
        out = ''
        for j in range(l):
            for i in range(m):
                if strs[i][j] != strs[0][j]:
                    return out
            out += strs[i][j]
        return out

        