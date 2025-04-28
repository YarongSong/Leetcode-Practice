class Solution(object):
    def countGoodTriplets(self, arr, a, b, c):
        """
        :type arr: List[int]
        :type a: int
        :type b: int
        :type c: int
        :rtype: int
        """
        i = 0
        j = 1
        k = 2
        cnt = 0
        while i <= len(arr)-3:
            while j <= len(arr)-2:
                if abs(arr[i] - arr[j]) <= a:
                    while k <= len(arr) - 1:
                        if abs(arr[j] - arr[k]) <= b and abs(arr[i] - arr[k]) <= c:
                            cnt += 1
                        k += 1

                j += 1
                k = j + 1
            i += 1
            j = i + 1
            k = i + 2
        
        return cnt

        