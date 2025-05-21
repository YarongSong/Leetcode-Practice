class Solution:
    def numEquivDominoPairs(self, dominoes: List[List[int]]) -> int:
        if len(dominoes) == 1:
            return 0
        
        num = [0] * 100  # the sum is (11-99)
        res = 0

        for x,y in dominoes:
            if x <= y:
                val = x * 10 + y
            else:
                val = y * 10 + x
            
            res += num[val]
            num[val] += 1
        
        return res

            


        

        
        # res = 0
        # i = 0
        # j = 1
        # while i <= len(dominoes) - 2:
        #     while j <= len(dominoes) - 1:
        #         if (dominoes[i][0] == dominoes[j][1] and dominoes[i][1] == dominoes[j][0]) or (dominoes[i][0] == dominoes[j][0] and dominoes[i][1] == dominoes[j][1]):
        #             res += 1
        #         j += 1

        #     i += 1
        #     j = i + 1
        
        # return res


        