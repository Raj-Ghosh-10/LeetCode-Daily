class Numeric
    def max(v) = self < v ? v : self
    def min(v) = self > v ? v : self
end

OPS = [[100, 0], [75, 25], [50, 50], [25, 75]]

def soup_servings(n)
    return 0.5 if n.zero?
    return 1.0 if n >= 4800
    prob, cur = 0.0, {n => {n => 1.0}}
    while cur.any? {|k, v| k.positive? || v.any? {|vk, vv| vk.positive?} } do
        cur = cur.each_with_object(Hash.new {|h, k| h.update(k => Hash.new(0.0))}) {|(a, v), res|
            v.each {|b, p|
                OPS.each {|(da, db)|
                    newa, newb, newp = 0.max(a - da), 0.max(b - db), p / 4.0
                    prob += newp / (newb.zero? ? 2 : 1) if a.positive? && newa.zero? && !b.zero?
                    res[newa][newb] # for proper initialization
                    res[newa][newb] += newp if [newa, newb].all?(&:positive?)
                }
            }
        }
    end
    prob
end