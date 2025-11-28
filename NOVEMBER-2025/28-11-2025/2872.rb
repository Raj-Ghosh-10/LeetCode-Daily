# @param {Integer} n
# @param {Integer[][]} edges
# @param {Integer[]} values
# @param {Integer} k
# @return {Integer}
def max_k_divisible_components(n, edges, values, k)
  g = Array.new(n) { [] }

  edges.each do |a, b|
    g[a] << b
    g[b] << a
  end

  @ans = 0

  dfs = lambda do |u, p|
    sum = values[u]
    g[u].each do |v|
      next if v == p
      sum += dfs.call(v, u)
    end
    if sum % k == 0
      @ans += 1
      0
    else
      sum
    end
  end

  dfs.call(0, -1)
  @ans
end