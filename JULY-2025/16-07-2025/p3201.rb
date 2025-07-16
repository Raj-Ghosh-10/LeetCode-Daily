# @param {Integer[]} nums
# @return {Integer}
def maximum_length(nums)
  all_even = all_odd = even_odd = odd_even = 0
  
  nums.each do |num|
    if num.even?
      all_even +=1
      even_odd +=1 if even_odd.even? # pairs of even-odd are done, num can be first of new pair
      odd_even +=1 if odd_even.odd? # odd-even requires 1 even no. to complete the pairs
    else # vice versa for the other calculation
      all_odd +=1
      even_odd +=1 if even_odd.odd?
      odd_even +=1 if odd_even.even?
    end
  end

  [all_even, all_odd, even_odd, odd_even].max
end