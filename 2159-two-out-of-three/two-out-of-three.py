class Solution:
    def twoOutOfThree(self, nums1: List[int], nums2: List[int], nums3: List[int]) -> List[int]:
        d = {}
        for i in range(len(nums1)):
            if nums1[i] in d:
                d[nums1[i]][0] += 1
            else:
                d[nums1[i]] = [1,0,0]
        
        for i in range(len(nums2)):
            if nums2[i] in d:
                d[nums2[i]][1] += 1
            else:
                d[nums2[i]] = [0,1,0]

        for i in range(len(nums3)):
            if nums3[i] in d:
                d[nums3[i]][2] += 1
            else:
                d[nums3[i]] = [0,0,1]

        res = []
        for k,v in d.items():
            cnt = 0
            for value in v:
                if value > 0:
                    cnt += 1
            if cnt >= 2:
                res.append(k)

        return res
        

