class Solution:
    def removeOuterParentheses(self, s: str) -> str:
        if len(s) <= 2:
            return ""

        res = []
        opened = 0
        for c in s:
            if c == "(" and opened >= 1:
                res.append("(")
            elif c == ")" and opened >= 2:
                res.append(")")
            
            if c == "(":
                opened += 1
            else:
                opened -= 1
        
        return "".join(res)

        # st = []
        # res = ""
        # left = ""
        # right = ""

        # for i in range(len(s)):
        #     if s[i] == "(":
        #         st.append(s[i])
        #     elif s[i] == ")":
        #         if len(st) == 2:
        #             left += "()"
        #             st.pop()
        #         elif len(st) > 2:
        #             left += "("
        #             st.pop()
        #             right += ")"
        #         elif len(st) == 1:
        #             res += left 
        #             res += right
        #             st.pop()
        #             left = ""
        #             right = ""
        # return res









        