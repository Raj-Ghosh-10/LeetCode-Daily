def bisect_right(events, target)
    left = 0
    right = events.length

    while (left < right)
        mid = (left + right) / 2
        if (events[mid][0] <= target) 
            left = mid + 1
        else 
            right = mid 
        end 
    end 

    return left 
end 

def max_value(events, k)
    $events = events.sort_by! {|d| d[0]}


    $n = events.length
    $dp = Array.new(k + 1) { Array.new($n).map { -1 } }

    $starts = $events.map {|n| n[0]}


    def dfs(cur_index, count) 
        return 0 if (count == 0 or cur_index == $n)        
        return $dp[count][cur_index] if ($dp[count][cur_index] != -1)

        a = dfs(cur_index + 1, count)
        
        next_index = bisect_right($events, $events[cur_index][1])
        
        b = $events[cur_index][2] +  dfs(next_index, count - 1) 
        
        $dp[count][cur_index] = [a, b].max
        return $dp[count][cur_index]
    end 

    return dfs(0, k)
end