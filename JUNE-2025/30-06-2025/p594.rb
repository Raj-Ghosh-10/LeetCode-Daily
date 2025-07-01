def find_lhs(nums)
  freq = Hash.new(0)
  nums.each { |n| freq[n] += 1 }

  ans = 0
  freq.each do |key, val|
    if freq.key?(key + 1)
      ans = [ans, val + freq[key + 1]].max
    end
  end

  ans
end