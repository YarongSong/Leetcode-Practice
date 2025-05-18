class NumArray:

    def __init__(self, nums: List[int]):
        self.array = nums
        

    def sumRange(self, left: int, right: int) -> int:

        i = left
        res = 0
        while i >= left and i <= right:
            res += self.array[i]
            i += 1
        
        return res

        


# Your NumArray object will be instantiated and called as such:
# obj = NumArray(nums)
# param_1 = obj.sumRange(left,right)