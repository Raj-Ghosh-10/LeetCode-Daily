# frozen_string_literal: true
# @param {Integer[]} bits
# @return {Boolean}
def is_one_bit_character(bits)
  len = bits.length
  if len == 1
    return true
  end
  if len == 2 and bits[0] == 1
    return false
  end
  cur = 0
  while cur < len
    if bits[cur] == 1
      if len - cur == 2
        return false
      end
      cur += 2
      if len - cur == 1
        return true
      end
    else
      cur += 1
    end
  end
  true
end