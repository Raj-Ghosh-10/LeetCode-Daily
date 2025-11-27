# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def max_subarray_sum(nums, k)
  inf = 10**30
  min_prefix = Array.new(k, inf)
  min_prefix[0] = 0

  prefix = 0
  answer = -inf

  nums.each_with_index do |x, i|
    prefix += x
    mod = (i + 1) % k

    if min_prefix[mod] != inf
      answer = [answer, prefix - min_prefix[mod]].max
    end

    min_prefix[mod] = [min_prefix[mod], prefix].min
  end

  answer
end