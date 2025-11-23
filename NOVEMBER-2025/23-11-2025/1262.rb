# @param {Integer[]} nums
# @return {Integer}
def max_sum_div_three(nums)
    sum = 0

    m1a = Float::INFINITY
    m1b = Float::INFINITY
    m2a = Float::INFINITY
    m2b = Float::INFINITY

    nums.each do |x|
        sum += x
        r = x % 3

        if r == 1
            if x < m1a
                m1b = m1a
                m1a = x
            elsif x < m1b
                m1b = x
            end
        elsif r == 2
            if x < m2a
                m2b = m2a
                m2a = x
            elsif x < m2b
                m2b = x
            end
        end
    end

    rem = sum % 3
    return sum if rem == 0

    remove = Float::INFINITY

    if rem == 1
        opt1 = m1a
        opt2 = m2b < Float::INFINITY ? m2a + m2b : Float::INFINITY
        remove = [opt1, opt2].min
    else
        opt1 = m2a
        opt2 = m1b < Float::INFINITY ? m1a + m1b : Float::INFINITY
        remove = [opt1, opt2].min
    end

    remove == Float::INFINITY ? 0 : sum - remove
end