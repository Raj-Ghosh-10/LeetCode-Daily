class Numeric
    def min(v) = (self < v ? self : v)
    def max(v) = (self > v ? self : v)
end

def earliest_and_latest(n, *players)
    return [1, 1] if players.sum == n + 1
    return [2, 2] if (3..4).cover?(n)

    l, r = players.minmax
    l, r = n + 1 - r, n + 1 - l if l - 1 > n - r

    minr, maxr, nxtr = n, 1, (n + 1) / 2

    if r * 2 <= n + 1 then
        l.times {|i|
            (r - l).times {|j|
                nmin, nmax = earliest_and_latest(nxtr, i + 1, i + j + 2)
                minr = minr.min(nmin + 1)
                maxr = maxr.max(nmax + 1)
            }
        }
    else
        mirr = n - r + 1
        inn_gd2 = (r - mirr) / 2
        l.times {|i|
            (mirr - l).times {|j|
                nmin, nmax = earliest_and_latest(nxtr, i + 1, i + j + 2 + inn_gd2)
                minr = minr.min(nmin + 1)
                maxr = maxr.max(nmax + 1)
            }
        }
    end
    [minr, maxr]
end