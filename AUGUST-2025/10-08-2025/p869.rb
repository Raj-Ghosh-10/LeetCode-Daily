class String
    ZORD = '0'.ord

    def zord = (ord - ZORD)
    
    def to_sig = StrSig.new(self)
end

class StrSig
    NUM_CHARS = '9'.zord + 1
    
    attr_reader :sig
    
    def initialize(s)
        @sig = s.chars.each_with_object(Array.new(NUM_CHARS, 0)) {|c, r|
            r[c.zord] += 1
        }
    end
    
    def eql?(o) = sig.eql?(o.sig)
end

class Numeric
    def to_sig = to_s.to_sig
end

MAX = 10**9
MAXNUMP2 = Math.log2(MAX).ceil

def reordered_power_of2(n)
    p, nsig = 1, n.to_sig
    MAXNUMP2.times.any? {|i| [nsig.eql?(p.to_sig), p *= 2].first }
end