class Solution:
    def shortestDistance(self, wordsDict: List[str], word1: str, word2: str) -> int:
        word1_index = float('inf')
        word2_index = - float('inf')
        res = float('inf')
        for i in range(len(wordsDict)):
            if wordsDict[i] == word1:
                word1_index = i
            elif wordsDict[i] == word2:
                word2_index = i
            
            res = min(abs(word2_index-word1_index), res)
        
        return res


        