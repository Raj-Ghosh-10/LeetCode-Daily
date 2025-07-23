class String
    def remove(removing)
        a, b = removing.chars
        stack = each_char.with_object([]) {|c, stk|
            if c == b && stk.last == a then
                stk.pop
            else
                stk << c    
            end
        }
        [stack.join, (size - stack.size) / 2]
    end
end

def maximum_gain(s, x, y) = [['ab', x], ['ba', y]].sort_by(&:last).reverse_each.sum {|(patrn, cost)| (s, val = s.remove(patrn)).last * cost }