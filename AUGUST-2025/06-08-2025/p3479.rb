# @param {Integer[]} fruits
# @param {Integer[]} baskets
# @return {Integer}
class SegTree
    def initialize(baskets, n)
        @seg = Array.new(4 * n + 1, 0)
        build(baskets, 1, 0, n - 1)
    end

    def maintain(o)
        @seg[o] = [@seg[o * 2], @seg[o * 2 + 1]].max
    end

    def build(a, o, l, r)
        if l == r
            @seg[o] = a[l]
            return
        end
        m = (l + r) >> 1
        build(a, o << 1, l, m)
        build(a, o << 1 | 1, m + 1, r)
        maintain(o)
    end

    def find_first_and_update(o, l, r, x)
        return -1 if @seg[o] < x
        if l == r
            @seg[o] = -1
            return l
        end
        m = (l + r) >> 1
        i = find_first_and_update(o << 1, l, m, x)
        i = find_first_and_update(o << 1 | 1, m + 1, r, x) if i == -1
        maintain(o)
        return i
    end
end

def num_of_unplaced_fruits(fruits, baskets, n = baskets.size)
    return n if n == 0
    tree = SegTree.new(baskets, n)
    return fruits.each.count { |fruit| tree.find_first_and_update(1, 0, n - 1, fruit) == -1 }
end