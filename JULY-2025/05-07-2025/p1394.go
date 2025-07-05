func findLucky(arr []int) int {
    
    table := make(map[int]int)
    
    for _ , v := range arr {
        table[v]++
    }

    luckyNum := -1

    for k, v := range table {
        if k == v && k > luckyNum {
            luckyNum = k
        }
    }

    return luckyNum
}