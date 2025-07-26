func maxSubarrays(n int, conflictingPairs [][]int) int64 {
    // Step 1: Normalize pairs (ensure smaller element first)
    for i := range conflictingPairs {
        if conflictingPairs[i][0] > conflictingPairs[i][1] {
            conflictingPairs[i][0], conflictingPairs[i][1] = conflictingPairs[i][1], conflictingPairs[i][0]
        }
    }

    // Step 2: Sort by first element, then second
    sort.Slice(conflictingPairs, func(i, j int) bool {
        if conflictingPairs[i][0] == conflictingPairs[j][0] {
            return conflictingPairs[i][1] < conflictingPairs[j][1]
        }
        return conflictingPairs[i][0] < conflictingPairs[j][0]
    })

    // Step 3: Compress pairs - group conflicts by the same first element
    cf := compressPairs(conflictingPairs)

    // Step 4: Precompute minRight array
    minRight := buildMinRight(cf)

    // Step 5: Count subarrays initially (before removing any pair)
    totalSubArray := countInitialSubarrays(n, cf, minRight)

    // Step 6: Try removing each pair, track max result
    result := tryRemovePairs(n, cf, minRight, totalSubArray)

    return result
}

// --- Helper functions ---

func compressPairs(pairs [][]int) [][]int {
    cf := [][]int{{pairs[0][0], pairs[0][1]}}
    for i := 1; i < len(pairs); i++ {
        last := &cf[len(cf)-1]
        if pairs[i][0] == (*last)[0] {
            if len(*last) == 2 {
                *last = append(*last, pairs[i][1])
            }
        } else {
            cf = append(cf, []int{pairs[i][0], pairs[i][1]})
        }
    }
    return cf
}

func buildMinRight(cf [][]int) [][]int {
    minRight := make([][]int, len(cf))
    lastIdx := len(cf) - 1
    minRight[lastIdx] = []int{cf[lastIdx][0], cf[lastIdx][1]}
    for i := lastIdx - 1; i >= 0; i-- {
        minRight[i] = []int{
            cf[i][0],
            min(minRight[i+1][1], cf[i][1]),
        }
    }
    return minRight
}

func countInitialSubarrays(n int, cf, minRight [][]int) int64 {
    var total int64
    prevLeft := 0
    for i := range minRight {
        total += (int64(minRight[i][1]-prevLeft)*int64(minRight[i][1]-prevLeft-1) -
            int64(minRight[i][1]-minRight[i][0])*int64(minRight[i][1]-minRight[i][0]-1)) / 2
        prevLeft = minRight[i][0]
    }
    total += int64(n+1-minRight[len(minRight)-1][0]) * int64(n-minRight[len(minRight)-1][0]) / 2
    return total
}

func tryRemovePairs(n int, cf, minRight [][]int, base int64) int64 {
    result := base
    for i := range minRight {
        if i+1 < len(minRight) && minRight[i][1] == minRight[i+1][1] {
            continue
        }
        maxRight := n + 1
        if i+1 < len(minRight) {
            maxRight = minRight[i+1][1]
        }
        if len(cf[i]) > 2 {
            maxRight = min(maxRight, cf[i][2])
        }

        prevLeft := 0
        if i > 0 {
            prevLeft = minRight[i-1][0]
        }
        newTotal := (minRight[i][0] - prevLeft) * (maxRight - minRight[i][1])

        for j := i - 1; j >= 0; j-- {
            maxRight = min(cf[j][1], maxRight)
            if maxRight <= minRight[j][1] {
                break
            }
            prevLeft = 0
            if j > 0 {
                prevLeft = minRight[j-1][0]
            }
            newTotal += (minRight[j][0] - prevLeft) * (maxRight - minRight[j][1])
        }

        result = max(result, base+int64(newTotal))
    }
    return result
}

func min(a, b int) int {
    if a < b {
        return a
    }
    return b
}

func max(a, b int64) int64 {
    if a > b {
        return a
    }
    return b
}