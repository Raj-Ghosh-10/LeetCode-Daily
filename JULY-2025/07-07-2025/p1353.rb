class Numeric
    def max(v) = (self > v ? self : v)
end

class Array
    include Comparable
end

module PQ
    class SaPQ
        attr_reader :sa
        
        def initialize
            @sa = []
        end
        
        def <<(e) = @sa.insert(sa.bsearch_index {|w| w < e } || -1, e)
        
        def pop = @sa.pop
        
        def first = sa.last
        
        def empty? = sa.empty?
    end
end

class MinSaPQ < PQ::SaPQ
    alias min first

    alias min! pop
end

class Solver
    attr_reader :events, :n, :last_day

    def initialize(events)
        @events, @n, @last_day = events.sort_by(&:first), events.size, events.max_by(&:last).last
    end

    def solve
        i, pq = 0, MinSaPQ.new
        (1..last_day).inject(0) {|res, day|
            pq << events[(i += 1) - 1].last while i < n && events[i].first == day
            pq.min! while !pq.empty? && pq.min < day
            (pq.min!; res += 1) unless pq.empty?
            break res if i >= n && pq.empty?
            res
        }
    end
end

def max_events(events) = Solver.new(events).solve