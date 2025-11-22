# @param {Integer[]} nums
# @return {Integer}
def minimum_operations(nums)
    nums.count { |x| x % 3 != 0 }
end