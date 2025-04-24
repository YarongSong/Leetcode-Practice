class Solution:
    def containsNearbyDuplicate(self, nums: List[int], k: int) -> bool:
        if len(nums) < 2:
            return False

        d = {}
        for i in range(len(nums)):
            if nums[i] in d:
                if i - d[nums[i]] <= k:
                    return True
                else:
                    d[nums[i]] = i
            else:
                d[nums[i]] = i
        
        return False
        
        # for key, value in d.items():
        #     i = 0
        #     j = 1
        #     while i <= len(value) - 2:
        #         if value[j] - value[i] <= k:
        #             return True
        #         i += 1
        #         j += 1
        
        # return False
