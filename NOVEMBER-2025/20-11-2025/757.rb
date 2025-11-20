# @param {Integer[][]} intervals
# @return {Integer}
def intersection_size_two(intervals)
    intervals.sort_by! { |a| a[1] }

    prev1 = intervals[0][1] - 1
    prev2 = intervals[0][1]
    count = 2
    (1...intervals.length).each do |i|
        start = intervals[i][0]
        endp  = intervals[i][1]
        if prev2 < start
            prev1 = endp - 1
            prev2 = endp
            count += 2
        elsif prev1 < start
            if endp == prev2
                prev1 = endp - 1
            else
                prev1 = endp
            end
            if prev1 > prev2
                prev1, prev2 = prev2, prev1
            end

            count += 1
        end
    end
    return count
end