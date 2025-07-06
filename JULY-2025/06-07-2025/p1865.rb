class Array
    def replace_sorted!(ov, nv)
        i = bsearch_index {|w| w.first >= ov }
        raise "Not found: #{ov}" if i.nil?
        unless (self[i][1] -= 1).positive? then
            delete_at(i)
        end
        ni = bsearch_index {|w| w.first >= nv } || -1
        if !empty? && self[ni].first == nv then
            self[ni][1] += 1
        else
            insert(ni, [nv, 1])
        end
    end
end

class FindSumPairs

=begin
    :type nums1: Integer[]
    :type nums2: Integer[]
=end
    attr_reader :nums1, :nums2, :n1, :n2, :nums1_s, :nums2_s

    def initialize(nums1, nums2)
        @nums1, @nums2, @n1, @n2 = nums1, nums2, nums1.size, nums2.size
        @nums1_s, @nums2_s = [nums1, nums2].collect {|nums|
            nums.sort.slice_when {|a, b| a != b }.collect {|a| [a.first, a.size] }
        }
    end


=begin
    :type index: Integer
    :type val: Integer
    :rtype: Void
=end
    def add(index, val)
        @nums2_s.replace_sorted!(nums2[index], nums2[index] + val)
        @nums2[index] += val
    end


=begin
    :type tot: Integer
    :rtype: Integer
=end
    def count(tot)
        f = tot - nums1_s.first.first
        ri = nums2_s.bsearch_index {|w| w.first >= f } || nums2_s.size - 1
        nums1_s.inject(0) {|res, (v1, cnt1)|
            break res if v1 + nums2_s.first.first > tot
            # ri -= 1 while ri >= 0 && v1 + nums2_s[ri].first > tot
            ri = (0..ri).bsearch {|nri| v1 + nums2_s[nri].first >= tot } || ri
            ((v1 + nums2_s[ri].first == tot) ? (res + cnt1 * nums2_s[ri].last) : res)
        }
    end


end

# Your FindSumPairs object will be instantiated and called as such:
# obj = FindSumPairs.new(nums1, nums2)
# obj.add(index, val)
# param_2 = obj.count(tot)