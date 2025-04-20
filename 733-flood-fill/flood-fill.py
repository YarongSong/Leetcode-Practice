class Solution:
    def floodFill(self, image: List[List[int]], sr: int, sc: int, color: int) -> List[List[int]]:
        m = len(image)
        n = len(image[0])

        color_raw = image[sr][sc]

        if color == color_raw:
            return image
       
        image[sr][sc] = color
        if sr-1 >= 0 and image[sr-1][sc] == color_raw:
            self.floodFill(image, sr-1, sc, color)
        
        if sr+1 < m and image[sr+1][sc] == color_raw:
            self.floodFill(image, sr+1, sc, color)

        if sc-1 >= 0 and image[sr][sc-1] == color_raw:
            self.floodFill(image, sr, sc-1, color)
        
        if sc+1 < n and image[sr][sc+1] == color_raw:
            self.floodFill(image, sr, sc+1, color)
        
        return image
        

        

        