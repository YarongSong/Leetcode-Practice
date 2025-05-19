class Solution:
    def findEvenNumbers(self, digits: List[int]) -> List[int]:
        dc = {}
        for d in digits:
            if d in dc:
                dc[d] += 1
            else:
                dc[d] = 1
        
        print(dc)
        

        dc2 = dc.copy()


        res = []

        num = 100
        while num <= 999:
            if num % 2 == 0:
                num_str = str(num)
                i = 0
                while i <= len(num_str) - 1:
                    if int(num_str[i]) in dc2 and dc2[int(num_str[i])] > 0:
                        dc2[int(num_str[i])] -= 1
                        i += 1
                    else: 
                        break
                
                if i == len(num_str):
                    res.append(num)
                    print(num)
                num += 1
            else:
                num += 1
            
            dc2 = dc.copy()
        
        res.sort()
        return res



















        # res = set()
        # i = 0
        # j = 0
        # k = 0
        # while i <= len(digits) - 1:
        #     if digits[i] == 0:
        #         i += 1
        #         j = 0
        #         k = 0
        #     else:
        #         while j <= len(digits) - 1:
        #             if j == i:
        #                 k = 0
        #                 j += 1
        #             else:
        #                 while k<= len(digits) - 1:
        #                     if k == i or k == j:
        #                         k += 1
        #                     else:
        #                         intger = int(str(digits[i]) + str(digits[j]) + str(digits[k]))
        #                         if intger%2 == 0:
        #                             res.add(intger)
        #                         k += 1
        #                 k = 0
        #                 j += 1
        #         i += 1
        #         j = 0
        #         k = 0
        
        # res = list(res)
        # res.sort()
        
        # return res


        