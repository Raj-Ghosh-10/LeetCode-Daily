# @param {Integer[]} arr
# @return {Integer}
def subarray_bitwise_o_rs(arr)
  res = {}
  cur = {}
  
  arr.each do |x|
    nxt = {x => true}
    cur.each_key { |y| nxt[y | x] = true }
    cur.each_key { |k| res[k] = true }
    res[x] = true
    cur = nxt
  end
  
  cur.each_key { |k| res[k] = true }
  res.size
end