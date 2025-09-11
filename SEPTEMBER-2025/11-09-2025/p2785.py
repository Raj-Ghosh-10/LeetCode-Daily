class Solution:
    def sortVowels(self, s: str) -> str:
        stack = []
        vowels = {'a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'}

        for x in s:
            if x in vowels:
                stack.append(x)

        stack.sort(reverse=True)
        res = ''

        for x in s:
            if x in vowels:
                res += stack.pop()
            else:
                res += x

        return res