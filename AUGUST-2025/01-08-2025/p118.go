func generate(numRows int) [][]int {
    ans := make([][]int, numRows)
    ans[0] = []int{1}

    for i:=1; i<numRows; i++ {
        ans[i]=make([]int, len(ans[i-1])+1)
        ans[i][0] = 1
        ans[i][len(ans[i])-1] = 1
        for j:=1; j<len(ans[i])-1; j++ {
            ans[i][j] = ans[i-1][j-1]+ans[i-1][j]
        }
    }    

    return ans
}