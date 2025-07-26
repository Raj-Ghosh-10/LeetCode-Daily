class Numeric
    def max(v) = (self > v ? self : v)
end

def max_subarrays(n, conflicting_pairs)
    rights = Array.new(n + 1) { [] }
    conflicting_pairs.each {|p|
        min, max = p.minmax
        rights[max] << min
    }

    lf, ll, b, bmax = 0, 0, Array.new(n + 1, 0), 0

    rights.each_with_index.drop(1).inject(0) {|ans, (r, ri)|
        r.each {|lval|
            if lval > lf then
                lf, ll = lval, lf
            elsif lval > ll then
                ll = lval
            end
        }
        bmax = bmax.max(b[lf] += lf - ll) if lf.positive?
        ans + ri - lf
    } + bmax
end