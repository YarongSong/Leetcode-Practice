class Solution:
    def areOccurrencesEqual(self, s: str) -> bool:
        cnt = {}
        for i in range(len(s)):
            if s[i] not in cnt:
                cnt[s[i]] = 1
            else:
                cnt[s[i]] += 1
        
        c = cnt[s[0]]
        for key, value in cnt.items():
            if value != c:
                return False
        return True
        