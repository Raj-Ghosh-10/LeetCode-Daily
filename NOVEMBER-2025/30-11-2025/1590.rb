# @param {Integer[]} nums
# @param {Integer} p
# @return {Integer}
def min_subarray(nums, p)
    total = nums.sum
    need = total % p
    return 0 if need == 0

    mp = {0 => -1}
    prefix = 0
    res = nums.size

    nums.each_with_index do |x, i|
        prefix = (prefix + x) % p
        target = (prefix - need) % p
        res = [res, i - mp[target]].min if mp.key?(target)
        mp[prefix] = i
    end

    res == nums.size ? -1 : res
end