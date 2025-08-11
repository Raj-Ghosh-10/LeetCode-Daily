# @param {Integer} n
# @param {Integer[][]} queries
# @return {Integer[]}
class Solver
    MOD = 10**9 + 7

    attr_reader :n, :powpow, :powsum

    def initialize(n)
        @n, @powpow = n, n.digits(2).each_with_index.with_object([]) {|(v, i), res| res << i if v.positive? }
        @powsum = powpow.inject([0]) {|res, v| res << res.last + v }
    end

    def query(l, r) = (1 << ((powsum[r+1] || powsum.last) - powsum[l])) % MOD
end

def product_queries(n, queries)
    s = Solver.new(n)
    queries.collect {|(l, r)| s.query(l, r) }
end