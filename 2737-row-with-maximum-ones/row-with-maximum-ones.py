class Solution:
    def rowAndMaximumOnes(self, mat: List[List[int]]) -> List[int]:
        r = len(mat)
        c = len(mat)

        max_cnt = 0
        min_row = 0

        i = 0

        while i < r:
            if sum(mat[i]) > max_cnt:
                max_cnt = sum(mat[i])
                min_row = i
            i += 1
        
        return [min_row, max_cnt]
        