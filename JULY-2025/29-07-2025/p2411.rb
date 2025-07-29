# @param {Integer[]} nums
# @return {Integer[]}
def smallest_subarrays(nums)
  n = nums.length

  # Calculate the smallest subarray length for each position
  result = Array.new(n, 1)
  last_seen = Array.new(32, -1)

  (n - 1).downto(0) do |i|
    nums[i].bit_length.times do |bit|
      last_seen[bit] = i if nums[i][bit] == 1
    end

    max_index = i
    last_seen.each do |index|
      max_index = [max_index, index].max if index != -1
    end

    result[i] = max_index - i + 1
  end

  result
end