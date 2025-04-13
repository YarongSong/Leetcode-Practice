class Solution:
    def isValid(self, s: str) -> bool:
        t = []
        d = {')':'(', '}':'{', ']':'['}
        e = {'(', '{', '['}
        for i in range(len(s)):
            if s[i] in e:
                t.append(s[i])
            elif len(t) != 0 and d[s[i]] == t[-1]:
                t.pop()
            else:
                return False

        if len(t) == 0:
            return True
        else:
            return False

        