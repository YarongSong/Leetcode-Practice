class Solution:
    def plusOne(self, digits: List[int]) -> List[int]:
        carry = 1
        res = deque()
        i = len(digits) - 1
        while i >= 0:
            # if (i == len(digits) - 1) and (digits[i] + carry != 10):
            #     res.appendleft(digits[i] + carry)
            #     carry = 0
            # elif i == len(digits) - 1:
            #     res.appendleft(0)
            #     carry = 1
            if digits[i] + carry != 10:
                res.appendleft(digits[i] + carry)
                carry = 0
            else:
                res.appendleft(0)
                carry = 1
            
            i -= 1
       
        if carry == 1:
            res.appendleft(1)
        
        return list(res)



        
