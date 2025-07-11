func mostBooked(n int, meetings [][]int) int {
    
    sort.Slice(meetings, func(i, j int) bool {return meetings[i][0] < meetings[j][0]})
    avail := make([]int64, n)
    cnt := make([]int, n)
    for _, m := range meetings {
        s, e := int64(m[0]), int64(m[1])
        earliestTime := int64(1<<63 - 1)
        earliestRoom := -1
        takeRoom := false

        for room := 0; room < n; room++{
            if avail[room] < earliestTime{
                earliestTime = avail[room]
                earliestRoom = room
            }
            if avail[room] <= s {
                takeRoom = true
                avail[room] = e
                cnt[room]++
                break
            }
        }
        if !takeRoom {
            cnt[earliestRoom]++
            avail[earliestRoom] += (e - s)
        }
    }
    best := 0
    for i := 1; i < n ; i++{
        if cnt[i] > cnt[best]{
            best = i
        }
    }
    return best
}