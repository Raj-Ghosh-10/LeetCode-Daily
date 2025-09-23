class Solution:
    def compareVersion(self, version1: str, version2: str) -> int:
        v1, v2 = version1.split('.'), version2.split('.')
        length = max(len(v1), len(v2))
        for i in range(length):
            digit1 = digit2 = 0
            if i < len(v1):
                digit1 = int(v1[i])
            if i < len(v2):
                digit2 = int(v2[i])
            if digit1 < digit2:
                return -1 
            elif digit1 > digit2:
                return 1
            else: 
                pass
        return 0