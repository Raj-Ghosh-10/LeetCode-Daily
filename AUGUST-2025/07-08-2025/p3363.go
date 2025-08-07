func maxCollectedFruits(fruits [][]int) int {
    N := len(fruits)
    var diagonalSum int
    for i := range N {
        diagonalSum += fruits[i][i]
        fruits[i] = append(fruits[i])
    }

    available := make([]bool, N)
    available[N-1] = true
    for i := 1; i< N-1; i++{
        for j := N - 1; j >= max(i+1, N-1-i); j--{
            var maxAvailable int
            if available[j-1] {
                maxAvailable = max(maxAvailable, fruits[i - 1][j - 1])
            }
            if available[j] {
                maxAvailable = max(maxAvailable, fruits[i - 1][j])
            }
            if j < N - 1{
                maxAvailable = max(maxAvailable, fruits[i - 1][j + 1])
            }
            fruits[i][j] += maxAvailable
            available[j] = true
        }
    }

    available = make([]bool, N)
    available[N - 1] = true
    for j := 1; j < N - 1; j++{
        for i := N-1; i >= max(j + 1, N-1-j); i--{
            var maxAvailable int
            if available[i-1] {
                maxAvailable = max(maxAvailable, fruits[i - 1][j - 1])
            }
            if available[i] {
                maxAvailable = max(maxAvailable, fruits[i][j-1])
            }
            if i < N - 1 {
                maxAvailable = max(maxAvailable, fruits[i+1][j-1])
            }
            fruits[i][j] += maxAvailable
            available[i] = true
        }
    }
    return diagonalSum + fruits[N - 1][N - 2] + fruits[N - 2][N-1]
}