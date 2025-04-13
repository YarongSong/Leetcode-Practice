class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        l = len(strs)
        min_l = len(strs[0])

        # find the common length
        for i in range(l):
            if len(strs[i]) < min_l:
                min_l = len(strs[i])

        res = ""
        for j in range(min_l):
            for i in range(l):
                if strs[i][j] != strs[0][j]:
                    return res
            res += strs[0][j]
        return res
                    




























        # m = len(strs)
        # l = len(strs[0])
        # for i in range(m):
        #     if len(strs[i]) < l:
        #         l = len(strs[i])
        # out = ''
        # for j in range(l):
        #     for i in range(m):
        #         if strs[i][j] != strs[0][j]:
        #             return out
        #     out += strs[i][j]
        # return out

        