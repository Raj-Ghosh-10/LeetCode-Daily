# @param {Integer} n
# @return {Boolean}
def is_power_of_two(n)
    integers = (0..100).to_a
    powerOfTwo = false
    integers.each do |i|
        if n == 2**i
            powerOfTwo = true
        end
    end 
    return powerOfTwo
end