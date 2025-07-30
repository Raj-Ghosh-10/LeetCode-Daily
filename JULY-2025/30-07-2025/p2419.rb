class Numeric
    def max(v) = (self > v ? self : v)
end

def longest_subarray(nums)
    maxv, curl = 0, 0
    nums.inject(0) {|res, v|
        case maxv <=> v
            when 1 then curl = 0
            when 0 then curl += 1
            when -1 then res, maxv, curl = 1, v, 1
        end
        res.max(curl)
    }
end