class Solution:
    def findKthPositive(self, arr: List[int], k: int) -> int:
        if arr[0] != 1:
            if k <= (arr[0] - 1 - 1 + 1):
                return k
            else:
                k -= (arr[0] - 1 - 1 + 1)
        
        i = 0
        while i + 1 <= len(arr) - 1:
            if arr[i+1] - arr[i] == 1:
                pass
            elif arr[i+1] - arr[i] > 1:
                if k <= arr[i+1] - arr[i] - 1:
                    return arr[i] + k
                elif k > arr[i+1] - arr[i] - 1:
                    k -= arr[i+1] - arr[i] - 1
            i += 1
        
        if k > 0:
            return arr[i] + k






        # def FindTarget(arr, target):
        #     if not arr:
        #         return False
            
        #     l = 0
        #     r = len(arr) - 1
        #     while l <= r:
        #         m = (l + r)//2
        #         if arr[m] == target:
        #             return True
        #         elif arr[m] < target:
        #             l = m + 1
        #         elif arr[m] > target:
        #             r -= 1
        #     return False
        
        # target = 1
        # cnt = 0
        # while cnt<= k:
        #     if not FindTarget(arr, target):
        #         cnt += 1
        #         if cnt == k:
        #             return target
        #     else:
        #         cnt += 0
        #     target += 1


        