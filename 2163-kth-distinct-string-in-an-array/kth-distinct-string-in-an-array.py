class Solution:
    def kthDistinct(self, arr: List[str], k: int) -> str:
        index = {}
        cnt = {}
        for i in range(len(arr)):
            if arr[i] not in cnt:
                cnt[arr[i]] = 1
                index[arr[i]] = [i]
            else:
                cnt[arr[i]] += 1
                index[arr[i]].append(i)
        
        res = []
        for key, v in cnt.items():
            if cnt[key] == 1:
                res.append(index[key][0])
        
        res.sort()

        if len(res) < k:
            return ""
        else:
            return arr[res[k-1]]

            
        