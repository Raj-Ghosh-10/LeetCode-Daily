# @param {Integer} n
# @return {Boolean}
def is_power_of_four(n)
# n > 0 and (power = Math.log(n, 3)) == power.to_i
  n > 0 && (int = Math.log(n, 4)) == int.to_i 
end