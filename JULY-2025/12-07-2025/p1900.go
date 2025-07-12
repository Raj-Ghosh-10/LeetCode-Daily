
import (
	"fmt"
	"math"
)

func earliestAndLatest(n, firstPlayer, secondPlayer int) []int {
	if firstPlayer > secondPlayer {
		firstPlayer, secondPlayer = secondPlayer, firstPlayer
	}
	r := n - secondPlayer + 1
	memo := map[[3]int][2]int{}

	var dfs func(l, r, k int) (int, int)
	dfs = func(l, r, k int) (int, int) {
		if l == r { 
			return 1, 1
		}
		if l > r { 
			return dfs(r, l, k)
		}
		key := [3]int{l, r, k}
		if v, ok := memo[key]; ok {
			return v[0], v[1]
		}
		earliest, latest := math.MaxInt32, 0
		halfUp := (k + 1) / 2          
		halfDown := l + r - k/2        
		for i := 1; i <= l; i++ {      
			for j := l - i + 1; j <= r-i; j++ { 
				if s := i + j; s < halfDown || s > halfUp {
					continue 
				}
				e, l8 := dfs(i, j, halfUp)
				if e+1 < earliest {
					earliest = e + 1
				}
				if l8+1 > latest {
					latest = l8 + 1
				}
			}
		}
		memo[key] = [2]int{earliest, latest}
		return earliest, latest
	}

	e, l := dfs(firstPlayer, r, n)
	return []int{e, l}
}