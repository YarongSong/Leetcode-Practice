
# 50, 100, 1, 1000

class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        if len(prices) == 1:
            return 0

        pre_min = 0
        min_index = 0
        max_index = 0
        profit = 0
        i = 0
        while i <= len(prices) - 1:
            if prices[i] <= prices[pre_min]:
                pre_min = i           
            elif prices[i] - prices[pre_min] >= profit:
                max_index = i
                min_index = pre_min
                profit = prices[i] - prices[pre_min]
            i += 1
        
        print(min_index, max_index)
        
        return profit
                






        
        