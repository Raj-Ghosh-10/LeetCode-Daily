func minimumScore(nums []int, edges [][]int) int {

	n := len(nums)

	connections := make([][]int, n)
	for _, edge := range edges {
		i, j := edge[0], edge[1]
		connections[i] = append(connections[i], j)
		connections[j] = append(connections[j], i)
	}
	enterTime, exitTime := make([]int, n), make([]int, n)
    subTreeXor := make([]int, n)
	var visit func(node, parent int) 
    time := 0
	visit = func(node, parent int) {
        enterTime[node] = time
        time++
        xor := nums[node]
		for _, child := range connections[node] {
            if child == parent {
                continue
            }
			visit(child, node)
            xor ^= subTreeXor[child]
		}
        subTreeXor[node] = xor
        exitTime[node] = time
	}
	visit(0, -1)
	isParent := func(parent, child int) bool {
        childEnterTime := enterTime[child]
        return childEnterTime > enterTime[parent] && childEnterTime < exitTime[parent]
	}

	minDiff := math.MaxInt
	for first := 1; first < n; first++ {
		for second := first + 1; second < n; second++ {
			segmentXors := [3]int{}
			if isParent(first, second) {
				segmentXors[0] = subTreeXor[0] ^ subTreeXor[first]
				segmentXors[1] = subTreeXor[first] ^ subTreeXor[second]
				segmentXors[2] = subTreeXor[second]
			} else if isParent(second, first) {
				segmentXors[0] = subTreeXor[0] ^ subTreeXor[second]
				segmentXors[1] = subTreeXor[second] ^ subTreeXor[first]
				segmentXors[2] = subTreeXor[first]
			} else {
				segmentXors[0] = subTreeXor[0] ^ subTreeXor[first] ^ subTreeXor[second]
				segmentXors[1] = subTreeXor[first]
				segmentXors[2] = subTreeXor[second]
			}
			sort.Ints(segmentXors[:])
			diff := segmentXors[2] - segmentXors[0]
			minDiff = min(minDiff, diff)
		}
	}

	return minDiff
}