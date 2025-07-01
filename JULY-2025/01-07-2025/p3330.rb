# @param {String} word
# @return {Integer}
def possible_string_count(word, total = 1)
    arr = word.split('')
    arr.each_with_index do |c,i|
        if c == arr[i-1] && i != 0
            total += 1
        end
    end 
    return total
end