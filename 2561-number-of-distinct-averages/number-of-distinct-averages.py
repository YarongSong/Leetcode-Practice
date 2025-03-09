class Solution:
    def distinctAverages(self, nums: List[int]) -> int:
        s = set()
        nums.sort()  # nlogn

        l = 0
        r = len(nums) - 1
        while l < r:
            avg = nums[l] + nums[r]
            s.add(avg)
            l += 1
            r -= 1

        return len(s)




        