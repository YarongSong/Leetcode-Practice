class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        if len(prices) == 1:
            return 0
        
        buy = float('inf')
        res = 0
        i = 0
        while i < len(prices):
            buy = min(prices[i], buy)
            profit = prices[i] - buy
            res = max(profit, res)
            i += 1
        return res



        