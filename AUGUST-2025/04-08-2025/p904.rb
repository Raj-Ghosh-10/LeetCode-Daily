class Numeric
    def max(v) = (self > v ? self : v)
end

class MultiSet
    attr_reader :set, :cnt

    def initialize
        @set, @cnt = Hash.new(0), 0
    end

    def <<(v) = (@cnt += 1 if (@set[v] += 1) == 1)

    def del(v) = (@cnt -= 1 if (@set[v] -= 1).zero?)

    def include?(k) = set[k].positive?

    def keys = cnt
end

def total_fruit(fruits)
    l, set = 0, MultiSet.new
    fruits.each_with_index.inject(0) {|res, (v, i)|
        set << v
        set.del(fruits[(l += 1) - 1]) while l < i && set.keys > 2
        res.max(i - l + 1)
    }
end