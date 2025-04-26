class Solution:
    def strStr(self, haystack: str, needle: str) -> int:
        if len(needle) > len(haystack):
            return -1
        
        i = 0
        j = 0
        res = float('inf')
        while i < len(haystack) and j < len(needle):
            if haystack[i] == needle[j]:
                res = min(i,res)
                i += 1
                j += 1
                print(j)
            # elif haystack[i] == needle[j]:
            #     i += 1
            #     j += 1
            elif haystack[i] != needle[j] and j == 0:
                j = 0
                i += 1  
                res = float('inf')           
            else:
                j = 0
                i = res + 1
                res = float('inf') 
                
        
        if j == len(needle):
            return res
        else:
            return -1






























        # if len(haystack) < len(needle):
        #     return -1
        # res = []
        # j = 0
        # i = 0 
        # while i < len(haystack):
        #     k = i
        #     while k < len(haystack) and j < len(needle):
        #         if haystack[k] == needle[j]:
        #             k += 1
        #             j += 1
        #         else:
        #             j = 0
        #             break
        #     if j == len(needle):
        #         return i
        #     else:
        #         i += 1
        
        # return -1


       