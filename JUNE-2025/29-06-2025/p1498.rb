# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def num_subseq(nums, target)
  nums.sort!

  result = 0

  nums.each_with_index do |num, index|
    break if (num * 2) > target

    max_index = (nums.bsearch_index {|num_searched| num_searched > (target - num) } || nums.size) - 1
    result += 2 ** (max_index - index )
  end

  result % (10 ** 9 + 7)
end