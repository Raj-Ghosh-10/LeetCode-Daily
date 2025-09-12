class Solution:
    def doesAliceWin(self, s: str) -> bool:
        vo=['a','e','i','o','u']

        return any ( i in vo for i in s  )
        