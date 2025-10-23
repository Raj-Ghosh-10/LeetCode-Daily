class Solution(object):
    def hasSameDigits(self, s):
        a = list(s)
        for i in range(len(a) - 1, 1, -1):
            for j in range(i):
                a[j] = str((int(a[j]) + int(a[j + 1])) % 10)
        return a[0] == a[1]