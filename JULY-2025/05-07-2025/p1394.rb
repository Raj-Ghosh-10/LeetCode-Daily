# @param {Integer[]} arr
# @return {Integer}
def find_lucky(arr)
    lucky = -1
    tmp_arr = arr.uniq
    tmp_arr.each do |num|
        lucky = num if arr.count(num) == num && num > lucky
    end
   lucky
end