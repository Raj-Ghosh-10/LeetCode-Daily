def longest_subsequence_repeated_k s, k
    c = s.each_char.tally.flat_map { [_1] * (_2 / k) }
    return '' if c.empty?
    z = (s = s.each_byte.select { c.include? _1.chr }).size
    for len in (1..c.size).reverse_each
        c.combination(len)
         .uniq
         .flat_map { _1.permutation.map &:join }
         .uniq
         .sort!
         .reverse!
         .each do | r |
            a, i, si = r.bytes, 0, -1
            l = k * len
            while z - (si += 1) >= l
                next unless s[si] == a[i]
                return r if (l -= 1) == 0
                i = 0 if (i += 1) == len
            end
        end
    end
end