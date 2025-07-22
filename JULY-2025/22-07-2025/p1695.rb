# @param {Integer[]} nums
# @return {Integer}
def maximum_unique_subarray(nums)
    tmp = {}
    max = 0
    right = 0
    i = 0
    run_sum = [0]
    while right < nums.size
        if tmp[nums[right]]
            i = [tmp[nums[right]] + 1, i].max
        end
        run_sum[right] = run_sum[right - 1] + nums[right]
        tmp[nums[right]] = right
        other_max = i == 0 ? 0 : run_sum[i - 1]
        max = [max, run_sum[right] - other_max].max
        right += 1
    end    
    max
end