# @param {Integer} num_rows
# @return {Integer[][]}
def generate(num_rows)
  base = [[1]]
  (1...num_rows).each do |r|
    prev = base[-1]
    row = [1]

    i = 1
    while i < r
      row << prev[i - 1] + prev[i]
      i += 1
    end

    row << 1
    base << row
  end
  base
end