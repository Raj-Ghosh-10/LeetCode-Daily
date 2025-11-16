def num_sub(s)
  left = 0
  count = 0
  res = 0
  mod = 1_000_000_007
  s.each_char.with_index do |char, right|
    if char == '1'
      count += 1
      res = (res + count) % mod
    else
      count = 0
    end
  end
  res
end