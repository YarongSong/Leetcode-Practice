class Solution:
    def arrayPairSum(self, nums: List[int]) -> int:

        nums.sort()
        print(nums)
        res = 0
        for i in range(len(nums)):
            if i % 2 == 0:
                print(nums[i])
                res += nums[i]
        return res

        