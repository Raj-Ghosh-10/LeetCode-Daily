# @param {Integer} n
# @return {Boolean}
def is_power_of_three(n)
    integers = (0..100).to_a 
    powerOfThree = false

    integers.each_with_index do |i|
        powerOfThree = true if n == 3 ** i 
    end 
    return powerOfThree
end