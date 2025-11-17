# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def k_length_apart(nums, k)
    prev = -1
    nums.each_with_index do |val, i|
        if val == 1
            if prev != -1 && (i - prev - 1) < k
                return false
            end
            prev = i
        end
    end
    true
end