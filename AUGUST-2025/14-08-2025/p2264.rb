# @param {String} num
# @return {String}
def largest_good_integer(num)
  num.scan(/((.)\2\2)/).map(&:first).max || ''
end