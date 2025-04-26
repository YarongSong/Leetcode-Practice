class Solution:
    def singleNumber(self, nums: List[int]) -> int:
        return sum(set(nums)) * 2 - sum(nums)
        # if len(nums) == 1:
        #     return nums[0]

        # dic = {}
        # for n in nums:
        #     if n in dic:
        #         dic[n] += 1
        #     else:
        #         dic[n] = 1

        # for key, value in dic.items():
        #     if value == 1:
        #         return key





























        # dic = {}
        # for i in range(len(nums)):
        #     if nums[i] not in dic:
        #         dic[nums[i]] = 1
        #     else:
        #         dic[nums[i]] += 1
        # for j in dic:
        #     if dic[j] == 1:
        #         return j
        