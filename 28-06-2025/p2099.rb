# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def max_subsequence(nums, k)
    sorted_nums = nums.sort

    hash = Hash.new(0)
    sorted_nums[nums.size - k..-1].each do |num|
        hash[num] += 1
    end

    answer = []
    nums.each do |num|
        if hash[num] > 0
            hash[num] -= 1
            answer << num
        end
    end

    answer
end