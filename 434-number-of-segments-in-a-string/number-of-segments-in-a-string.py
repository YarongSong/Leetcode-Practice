class Solution:
    def countSegments(self, s: str) -> int:
        strings = s.split(" ")

        cnt = 0

        for s in strings:
            if len(s) > 0:
                cnt += 1
        
        return cnt

        




        