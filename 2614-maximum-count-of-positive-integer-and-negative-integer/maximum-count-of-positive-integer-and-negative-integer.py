class Solution:
    def maximumCount(self, nums: List[int]) -> int:
        left = 0
        right = len(nums) - 1
        while left < right - 1:
            mid = (left + right) // 2
            if nums[mid] < 0:
                left = mid
            elif nums[mid] == 0:
                right = mid - 1
            elif nums[mid] > 0:
                right = mid - 1
        if nums[right] < 0:
            neg = right - 0 + 1
        elif nums[left] < 0:
            neg = left - 0 + 1
        else:
            neg = 0

        left = 0
        right = len(nums) - 1        
        while left < right - 1:
            mid = (left + right) // 2
            if nums[mid] > 0:
                right = mid
            elif nums[mid] == 0:
                left = mid + 1
            elif nums[mid] < 0:
                left = mid + 1
        if nums[left] > 0:
            pos = len(nums) - 1 - left + 1
        elif nums[right] > 0:
            pos = len(nums) - 1 - right + 1
        else:
            pos = 0
    
        return max(neg,pos)
        