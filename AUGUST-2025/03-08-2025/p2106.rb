class Numeric
    def max(v) = (self > v ? self : v)
    def min(v) = (self < v ? self : v)
end

class Solver
    attr_reader :fruits, :start_pos

    def initialize(fruits, start_pos)
        @fruits, @start_pos = fruits, start_pos
    end

    def min_s(lpos, rpos)
        d = rpos - lpos
        ((start_pos - lpos).abs + d).min((start_pos - rpos).abs + d)
    end

    def solve(k)
        l, sum = 0, 0
        fruits.each_with_index.inject(0) {|res, ((pos, f), i)|
            sum += f
            sum -= fruits[(l += 1) - 1].last while l <= i && min_s(fruits[l].first, pos) > k
            res.max(sum)
        }
    end
end

def max_total_fruits(fruits, start_pos, k) = Solver.new(fruits, start_pos).solve(k)