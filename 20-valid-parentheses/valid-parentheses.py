# Only when the list is not empty, the index would work
# lst.pop(): Remove and return the last item
# lst.remove(x): Remove first occurrence of value x
class Solution:
    def isValid(self, s: str) -> bool:
        st = []
        p = {")": "(", "}":"{", "]":"["}
        o = {'(', '[', '{'}
        for i in s:
            if i in o:
                st.append(i)
            else:
                if len(st) == 0:     ############
                    return False
                elif st[-1] == p[i]:
                    st.pop()
                else:
                    return False
                
        if len(st) != 0:
            return False

        return True
        