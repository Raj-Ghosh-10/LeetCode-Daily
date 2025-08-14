func largestGoodInteger(num string) string {
    r := []rune(num)
    arr := make([]int, 10)
    for i := 1; i < len(r) - 1; i++ {
        if r[i] == r[i-1] && r[i] == r[i+1] {
            arr[int(r[i])-48] = 1
        }
    }
    for i := len(arr)-1; i >= 0; i-- {
        if arr[i] == 1 {
            return fmt.Sprintf("%d%d%d",i,i,i)
        }
    }
    return ""
}