def minimum_one_bit_operations(n)
  ind = 0
  ans = []
  while n != 0
    if (n & 1) == 1
      temp = 2**ind
      temp = temp * 2
      temp -= 1
      ans.push(temp)
    end
    ind += 1
    n = n >> 1
  end
  res = 0
  ans.reverse!
  flag = true
  ans.each do |it|
    if flag
      res += it
      flag = false
    else
      res -= it
      flag = true
    end
  end
  res
end