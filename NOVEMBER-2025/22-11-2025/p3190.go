func minimumOperations(nums []int) int {
    ans := 0
    for _, x := range nums {
        if x%3 != 0 {
            ans++
        }
    }
    return ans
}