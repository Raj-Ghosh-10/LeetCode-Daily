import "math"

func findLHS(nums []int) int {
    freq := map[int]int{}
    for _, n := range nums {
        freq[n]++
    }

    ans := 0
    for key := range freq {
        if val, ok := freq[key+1]; ok {
            ans = int(math.Max(float64(ans), float64(freq[key]+val)))
        }
    }

    return ans
}