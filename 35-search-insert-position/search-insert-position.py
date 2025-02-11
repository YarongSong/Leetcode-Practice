class Solution:
    def searchInsert(self, nums: List[int], target: int) -> int: 
        left = 0
        right = len(nums) - 1

        while left < right-1:
            mid = (left + right) // 2
            if nums[mid] == target:
                return mid
            elif nums[mid] < target:
                left = mid
            else:
                right = mid
        
        if nums[left] < target and nums[right] > target:
            return left + 1
        elif nums[left] == target:
            return left
        elif nums[left] > target:
            return max(left-1, 0)
        elif nums[right] == target:
            return right
        elif nums[right] < target:
            return right + 1


















        # if len(nums) == 1 and nums[0] >= target:
        #     return 0
        # elif len(nums) == 1 and nums[0] < target:
        #     return 1


        # left = 0
        # right = len(nums) - 1
        # while left < right-1:
        #     mid = (left + right)//2
        #     if nums[mid] == target:
        #         return mid
        #     elif nums[mid] < target:
        #         left = mid
        #     else:
        #         right = mid
        # if nums[left] == target:
        #     return left
        # elif nums[right] == target:
        #     return right
        # elif nums[left] < target and nums[right] > target:
        #     return left + 1
        # elif nums[left] > target:
        #     return max(left - 1, 0)
        # else:
        #     return right + 1



        