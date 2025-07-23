class Solution:
    def maximumGain(self, s: str, x: int, y: int) -> int:
        
        res = 0
        def count(st, pat, score):
            nonlocal res
            stack = []
            for c in st:
                if stack and stack[-1] == pat[0] and c == pat[1]:
                    stack.pop()
                    res += score
                else:
                    stack.append(c)
            return "".join(stack)
                
        if x >= y:
            rem = count(s, "ab", x)
            _ = count(rem, "ba", y)
        else:
            rem = count(s, "ba", y)
            _ = count(rem, "ab", x)
        return res
    

        