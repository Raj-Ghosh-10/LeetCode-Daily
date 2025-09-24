class Solution:
    def fractionToDecimal(self, numerator: int, denominator: int) -> str:
        if numerator == 0:
            return "0"

        neg = 0 
        if numerator < 0 or denominator < 0:
            neg = 1
        if  numerator < 0 and denominator < 0:
            neg = 0
        dividend = abs(numerator)
        divisor = abs(denominator)
        quotient, remainder = 0, 0

        quotient_str = ""
        if neg == 1:
            quotient_str = "-"

        remainder = dividend % divisor
        quotient = dividend // divisor
        if remainder == 0:
            if neg == 1:
                return "-"+str(quotient)
            return str(quotient)
        quotient_str += str(quotient) + "."
        flag = -1

        decimal_quotient = ""
        remainder_quotient_history = {}

        last_hope = 0
        while True:
            # print(remainder, remainder_history)
            if remainder == 0:
                break
            dividend = remainder * 10
            remainder = dividend % divisor
            quotient = dividend // divisor
            if ((remainder, quotient) in remainder_quotient_history):
                flag = remainder_quotient_history[(remainder, quotient)]
                break
            decimal_quotient += str(quotient)
            remainder_quotient_history[(remainder,quotient)] = last_hope
            last_hope+=1
        
        
        if flag != -1:
            decimal_quotient = decimal_quotient[:flag] + "(" + decimal_quotient[flag:] + ")"
            return quotient_str+decimal_quotient
        return quotient_str+decimal_quotient
        