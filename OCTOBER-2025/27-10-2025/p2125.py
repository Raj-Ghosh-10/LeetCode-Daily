class Solution:
    def numberOfBeams(self, bank: List[str]) -> int:
        arr = []
        for st in bank:
            count = 0
            for s in st:
                if s == '1':
                    count += 1
            if count != 0:           
                arr.append(count)
        
        out = 0
        for i in range(len(arr) - 1):  
            out += arr[i] * arr[i + 1]
        return out