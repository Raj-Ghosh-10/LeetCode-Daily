func maxTotalFruits(fruits [][]int, startPos int, k int) int {
	// find min and max indexes for window
	lowIdx := sort.Search(len(fruits), func(i int) bool { return fruits[i][0] >= startPos-k })
	hiIdx := sort.Search(len(fruits), func(i int) bool { return fruits[i][0] > startPos+k })

	curr := 0
	res := 0
	leftIdx := lowIdx
	for rightIdx := lowIdx; rightIdx < hiIdx; rightIdx++ { // move right side on every step
		curr += fruits[rightIdx][1]
		//calculate minimum left position
		var minLeftPos int
		if fruits[rightIdx][0] <= startPos {
			minLeftPos = startPos - k
		} else {
			minLeftPos = min(
				2*fruits[rightIdx][0]-startPos-k,     // first go right, then turn left
				(fruits[rightIdx][0]-k+startPos+1)/2, // first go left then go right // need +1 because of division; avoid division!
			)
		}
		// remove fruits from the left if needed
		if fruits[leftIdx][0] < minLeftPos { // if window is too big
			for fruits[leftIdx][0] < minLeftPos { // shrink it
				curr -= fruits[leftIdx][1]
				leftIdx++
			}
		}
		//
		res = max(res, curr)
	}
	return res
}