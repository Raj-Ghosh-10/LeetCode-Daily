#python 

class Solution(object):
    def countOperations(self, num1, num2):
        """
        :type num1: int
        :type num2: int
        :rtype: int
        """
        k = 0
        while num1 != 0 and num2 != 0:
            if num2 > num1:
                if num1 > 0:
                    a = num2 - num1
                    if a == 0:
                        k += 1
                        num2 -= num1
                    b1 = a / num1
                    b2 = math.ceil(b1)
                    k += b2
                    num2 -= (b2 * num1)
                else:
                    k += 1
                    num2 -= num1
            else:
                if num1 > 0:
                    a = num1 - num2
                    if a == 0:
                        k += 1
                        num1 -= num2
                    b1 = a / num2
                    b2 = math.ceil(b1)
                    k += b2
                    num1 -= (b2 * num2)
                else:
                    k += 1
                    num1 -= num2
        return int(k)


#python3

class Solution:
    def countOperations(self, num1: int, num2: int) -> int:
        if num1 == 0 or num2 == 0:
            return 0
        elif num1 < num2:
            return self.countOperations(num2, num1)
        else:
            return num1 // num2 + self.countOperations(num2, num1 % num2)