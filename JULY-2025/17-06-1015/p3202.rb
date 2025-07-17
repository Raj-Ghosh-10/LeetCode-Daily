class Numeric
    def max(v) = (self > v ? self : v)
end

def maximum_length(nums, k)
    dp = Array.new(k + 1, 0)
    k.times.inject(0) {|ans, i|
        dp.fill(0)
        nums.inject(ans) {|ans1, v|
            j = v % k
            ans1.max(dp[j] = dp[j].max(dp[(i - j) % k] + 1))
        }
    }
end