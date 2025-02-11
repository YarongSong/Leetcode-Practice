class Solution:
    def fixedPoint(self, arr: List[int]) -> int:
        left = 0
        right = len(arr) - 1
        while left < right:
            mid = (left + right) // 2
            if arr[mid] == mid:
                right = mid
            elif arr[mid] > mid:
                right = mid - 1
            elif arr[mid] < mid:
                left = mid + 1
        if arr[left] == left:
            return left
        # elif arr[right] == right:
        #     return right
        return -1


        