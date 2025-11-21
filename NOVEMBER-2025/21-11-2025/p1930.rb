# @param {String} s
# @return {Integer}
def count_palindromic_subsequence(s)
  n = s.length
  first = Array.new(26, -1)
  last = Array.new(26, -1)
  bytes = s.bytes

  (0...n).each do |i|
    c = bytes[i] - 97
    first[c] = i if first[c] == -1
    last[c] = i
  end

  ans = 0
  (0...26).each do |c|
    if first[c] != -1 && last[c] - first[c] > 1
      mask = 0
      ((first[c] + 1)...last[c]).each do |i|
        mask |= 1 << (bytes[i] - 97)
      end
      ans += mask.to_s(2).count('1')
    end
  end

  ans
end