# @param {Integer[]} nums
# @return {Integer}
def count_max_or_subsets(nums)
    dp = Hash.new(0)
    dp[0] = 1
    nums.each do |nums|
      cl = dp.clone
      cl.each do |k, v|
        dp[k | nums] += v
      end
    end
    dp[dp.keys.max]
end