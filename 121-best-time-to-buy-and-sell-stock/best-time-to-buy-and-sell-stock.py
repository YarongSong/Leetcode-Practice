class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        min_p = float("inf")
        max_p = 0
        for i in range(len(prices)):
            if prices[i] <= min_p:
                min_p = prices[i]
            elif prices[i] - min_p > max_p:
                max_p = prices[i] - min_p
        
        return max_p




















        # if len(prices) <= 1:
        #     return 0
        
        # res = 0
        # i = 0
        # j = 1
        # while i < len(prices)-1:
        #     while j < len(prices):
        #         res = max(res, prices[j]-prices[i])
        #         j += 1
        #     i += 1
        #     j = i + 1
        # return res

