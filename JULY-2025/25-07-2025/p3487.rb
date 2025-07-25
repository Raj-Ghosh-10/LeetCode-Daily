# @param {Integer[]} nums
# @return {Integer}
def max_sum(nums)
    nums = nums.uniq
    sum = -1
    nums.each do |num|
        sum += num if num >= 0
    end
    return nums.max if sum == -1
    sum + 1
end