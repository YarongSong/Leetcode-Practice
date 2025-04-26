class Solution:
    def isValid(self, s: str) -> bool:
        if len(s) < 2:
            return False
            
        open_bracket_lst = []
        pairs = {')': '(', '}':'{', ']':'['}
        open_bracket = {'(', '[', '{'}

        for st in s:
            if st in open_bracket:
                open_bracket_lst.append(st)
            elif len(open_bracket_lst) == 0:
                return False           
            elif pairs[st] == open_bracket_lst[-1]:
                open_bracket_lst.pop()
            else:
                return False
        
        if len(open_bracket_lst) == 0:
            return True
        else:
            return False


        