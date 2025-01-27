class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        ele = {}
        for k,v in enumerate(nums):
            if (target-v) in ele:
                return [ele[target-v], k]
            else:
                ele[v] = k

        return


        