
// day between event?
func dBE(event []int, d int) bool {
    return event[0] <= d && event[1] >= d
}

// Erase Event, ie attended
func eE(event []int) {
    event[0] = 0
    event[1] = 1
}

// Get Event starting from given index but falling on day d
func getNextEvent(events []*[]int, idx *int, d int) *[]int {
    for (*idx) < len(events) {
        if dBE(*events[*idx], d) {
            return events[*idx]
        }
        if (*events[*idx])[0] < d {
            (*idx)++
        } else {
            break
        }
    }
    return nil
}


func maxEvents(events [][]int) int {
    s := make([]*[]int, len(events))
    e := make([]*[]int, len(events))

    // Store the events
    for i:=0; i<len(events); i++ {
        s[i] = &(events[i])
        e[i] = &(events[i])
    }
    // sort the s by start time, if start time is equal, then end time
    sort.Slice(s, func(i, j int)bool {
       return (*s[i])[0] < (*s[j])[0] || ((*s[i])[0] == (*s[j])[0] && (*s[i])[1] < (*s[j])[1])
    })
    // sort the e by end time, if end time equal, then start time
    sort.Slice(e, func(i, j int)bool {
        return (*e[i])[1] < (*e[j])[1] || ((*e[i])[1]==(*e[j])[1] && (*e[i])[0] < (*e[j])[0])
    })

    si := 0 // Current start event index
    ei := 0 // current end event index
    d := 0  // current day
    result := 0
    for si < len(s) || ei < len(e) {
        d++
        s1 := getNextEvent(s, &si, d)
        e1 := getNextEvent(e, &ei, d)

        // If any event about to expired and falls on current day, attend it and mark it attended
        if e1 != nil && dBE(*e1, d) {
                    result++
                    eE(*e1) // mark attended, so we will not process it in the other list
        } else if s1 != nil && dBE(*s1, d) {
            
                    result++
                    eE(*s1) // mark attended, so we will not process it in the other list
        }
    }
    return result
}