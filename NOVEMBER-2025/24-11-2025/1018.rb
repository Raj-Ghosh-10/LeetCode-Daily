# @param {Integer[]} nums
# @return {Boolean[]}
def prefixes_div_by5(nums)
    ans = []
    mod = 0

    nums.each do |bit|
        mod = (mod * 2 + bit) % 5
        ans << (mod == 0)
    end

    ans
end