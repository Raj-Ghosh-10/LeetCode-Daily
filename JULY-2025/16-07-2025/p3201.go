func maximumLength(nums []int) int {
    odd,evn,alt,lst := 0,0,1,0
    if nums[0] % 2 == 1 { lst,odd = 1,1 } else { evn = 1 }
    for i:=1; i<len(nums); i++ {
        m := nums[i] % 2
        if m == 0 { evn++ } else { odd++ }
        if m != lst { alt, lst = alt+1, m }
    }
    if alt >= odd && alt >= evn { return alt }
    if odd > evn { return odd }
    return evn
}