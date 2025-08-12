# @param {Integer} n
# @param {Integer} x
# @return {Integer}
MOD = 10**9 + 7

class Numeric
    def pow(p)
        x = self
        p.bit_length.times.inject(1) {|res, i|
            res *= x if p[i].positive?
            x *= x
            res
        }
    end
end

def number_of_ways(n, x)
    dp = Array.new(n + 1, 0)
    dp[0] = 1
    (1..n).each {|i|
        break if (pow = i.pow(x)) > n
        n.downto(pow) {|sum| dp[sum] = (dp[sum] + dp[sum - pow]) % MOD }
    }
    dp[n]
end