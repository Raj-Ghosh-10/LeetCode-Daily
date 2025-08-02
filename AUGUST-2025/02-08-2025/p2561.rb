# @param {Integer[]} basket1
# @param {Integer[]} basket2
# @return {Integer}
def min_cost(basket1, basket2)
    hash = Hash.new(0)

    (0...basket1.length).each do |i|
        hash[basket1[i]] += 1
        hash[basket2[i]] -= 1
    end
    min = [basket1.min, basket2.min].min

    list = [] # will store keys having equal counts in the hash
    hash.each do |key, value|
        diff_count = value.abs
        if diff_count % 2 != 0 # if for any character count is odd, return -1 cannot be swapped.
            return -1
        end

        diff_count /= 2
        while diff_count > 0
            list << key
            diff_count -= 1
        end
    end
    
    list.sort!
    cost = 0
    (0...(list.size / 2)).each do |i|
        # 2 types of swapping
        # direct swapping will cost list[i] which is min value of either array.
        # indirect swapping cost = 2x
        cost += [2 * min, list[i]].min
    end
    cost
end