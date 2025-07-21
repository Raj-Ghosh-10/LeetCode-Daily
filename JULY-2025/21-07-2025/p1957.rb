# @param {String} s
# @return {String}
def make_fancy_string(s)
    return if s.length < 1 || s.length > 10**5 || s.ord < 97 || s.ord > 122

    new_str = ''
    c = 0
    for i in 1..(s.length) do
        if s[i - 1] == s[i]
            c = c + 1
        else
            c = 0
        end

        if c >= 2
            next
        else
            new_str << s[i-1]
        end
    end

    new_str
end