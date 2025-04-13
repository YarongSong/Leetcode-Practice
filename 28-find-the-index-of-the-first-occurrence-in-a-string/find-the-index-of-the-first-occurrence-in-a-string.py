class Solution:
    def strStr(self, haystack: str, needle: str) -> int:
        if len(haystack) < len(needle):
            return -1
        res = []
        j = 0
        i = 0 
        while i < len(haystack):
            k = i
            while k < len(haystack) and j < len(needle) and (k - i + 1) <= len(needle):
                if haystack[k] == needle[j]:
                    k += 1
                    j += 1
                else:
                    j = 0
                    break
            if j == len(needle):
                return i
            else:
                i += 1
        
        return -1


       