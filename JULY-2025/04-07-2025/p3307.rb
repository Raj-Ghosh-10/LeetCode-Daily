# @param {Integer} k
# @param {Integer[]} operations
# @return {Character}
def kth_character(k, operations)
  count = 0
  while k > 1
    pos = Math.log2(k).floor
    if k & (k - 1) == 0
      count += operations[0...pos].sum
      break
    else
      count += operations[pos]
      k -= 2**pos
    end
  end
  ('a'.ord + count % 26).chr
end