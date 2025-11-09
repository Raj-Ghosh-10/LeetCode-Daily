# @param {Integer} num1
# @param {Integer} num2
# @return {Integer}
def count_operations(num1, num2)
    count = 0

    while num1 > 0 && num2 > 0
        if num1 > num2
            cnt = num1 / num2
            num1 -= num2 * cnt
        else
            cnt = num2 / num1
            num2 -= num1 * cnt
        end

        count += cnt
    end

    count
end