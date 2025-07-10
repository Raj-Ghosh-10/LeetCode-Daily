class Numeric
    def max(v) = (self > v ? self : v)
end

class Solver
    class Mtg
        attr_reader :s, :e

        def initialize(s, e)
            @s, @e = s, e
        end

        def dur = (e - s)
    end

    attr_reader :ge, :mtgs

    def initialize(ge, st, et)
        @ge, @mtgs = ge, st.zip(et).collect {|(s, e)| Mtg.new(s, e) }
    end

    def solve(k)
        b, wsum = 0, 0
        (mtgs + [Mtg.new(ge, ge)]).each_with_index.inject(0) {|res, (mtg, idx)|
            wsum += mtg.dur - (idx <= k ? 0 : mtgs[idx - k - 1].dur)
            b = mtgs[idx - k - 1].e if idx > k
            res.max(mtg.e - b - wsum)
        }
    end
end

def max_free_time(event_time, k, start_time, end_time) = Solver.new(event_time, start_time, end_time).solve(k)