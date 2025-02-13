class Solution:
    def isMajorityElement(self, nums: List[int], target: int) -> bool:
        left = 0
        right = len(nums) - 1
        # Left index
        while left < right - 1:
            mid = (left+right)//2
            if nums[mid] == target:
                right = mid
            elif nums[mid] < target:
                left = mid + 1
            elif nums[mid] > target:
                right = mid - 1
        if nums[left] == target:
            l = left
        elif nums[right] == target:
            l = right
        else:
            return False
        
        # Right index
        left = 0
        right = len(nums) - 1
        while left < right - 1:
            mid = (left + right) // 2
            if nums[mid] == target:
                left = mid
            elif nums[mid] < target:
                left = mid + 1
            else:
                right = mid - 1
        print(l)
        
        if nums[right] == target:
            r = right
        elif nums[left] == target:
            r = left
        else:
            return False
        print(r)
        print(r - l + 1)
        print(len(nums)/2)
        
        return (r - l + 1) > len(nums)/2




        