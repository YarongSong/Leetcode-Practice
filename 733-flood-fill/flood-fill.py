class Solution:
    def floodFill(self, image: List[List[int]], sr: int, sc: int, color: int) -> List[List[int]]:
        
        if image[sr][sc] == color:
            return image
        
        raw_color = image[sr][sc]
        image[sr][sc] = color
        
        if sr-1 >=0 and image[sr-1][sc] == raw_color:
            self.floodFill(image, sr-1, sc, color)
        if sr+1 <= len(image) - 1 and image[sr+1][sc] == raw_color:
            self.floodFill(image, sr+1, sc, color)
        if sc-1 >=0 and image[sr][sc-1] == raw_color:
            self.floodFill(image, sr, sc-1, color)
        if sc+1 <= len(image[0]) - 1 and image[sr][sc+1] == raw_color:
            self.floodFill(image, sr, sc+1, color)
        
        return image


        

        