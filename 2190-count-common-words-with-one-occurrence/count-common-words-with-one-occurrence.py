class Solution:
    def countWords(self, words1: List[str], words2: List[str]) -> int:
        cnt1 = {}
        cnt2 = {}
        for w in words1:
            if w in cnt1:
                cnt1[w] += 1
            else:
                cnt1[w] = 1
        for w in words2:
            if w in cnt2:
                cnt2[w] += 1
            else:
                cnt2[w] = 1

        res = 0
        for k,v in cnt1.items():
            if v == 1 and k in cnt2 and cnt2[k] == 1:
                res += 1
        
        return res
