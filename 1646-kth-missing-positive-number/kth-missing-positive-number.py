class Solution:
    def findKthPositive(self, arr: List[int], k: int) -> int:

        def FindTarget(arr, target):
            if not arr:
                return False
            
            l = 0
            r = len(arr) - 1
            while l <= r:
                m = (l + r)//2
                if arr[m] == target:
                    return True
                elif arr[m] < target:
                    l = m + 1
                elif arr[m] > target:
                    r -= 1
            return False
        
        target = 1
        cnt = 0
        while cnt<= k:
            if not FindTarget(arr, target):
                cnt += 1
                if cnt == k:
                    return target
            else:
                cnt += 0
            target += 1


        