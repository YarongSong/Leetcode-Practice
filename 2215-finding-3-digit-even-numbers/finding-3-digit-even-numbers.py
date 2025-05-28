class Solution(object):
    def findEvenNumbers(self, digits):
        """
        :type digits: List[int]
        :rtype: List[int]
        """
        # lst = [0] * 900
        res = []

        d = {}
        for n in digits:
            if n in d:
                d[n] += 1
            else:
                d[n] = 1
        
        n = 100
        while n <= 999:
            n = str(n)
            i = 0
            t = {}
            invalid = False
            while i < 3:
                if n[i] in t:
                    t[n[i]] += 1
                else:
                    t[n[i]] = 1
                i += 1
            
            for k, v in t.items():
                if int(k) not in d:
                    invalid = True
                    break
                elif v > d[int(k)]:
                    invalid = True
                    break
            
            if invalid == False and int(n) % 2 == 0:
                res.append(int(n))
            
            n = int(n) + 1
            invalid = False
        
        res.sort()
        return res


            
             

            

        