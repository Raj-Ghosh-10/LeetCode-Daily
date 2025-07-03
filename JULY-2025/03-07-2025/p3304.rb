class String
    T = [('a'..'z').to_a, ('b'..'z').to_a + ['a']].collect {|a| a.join }
    def shift = tr(*T)
end

def kth_character(k)
    s = 'a'
    s += s.shift while s.size < k
    s[k - 1]
end