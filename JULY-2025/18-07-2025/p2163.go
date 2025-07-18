import (
	"container/heap"
	"fmt"
)

type MaxHeap []int
type MinHeap []int

func (h MaxHeap) Len() int           { return len(h) }
func (h MaxHeap) Less(i, j int) bool { return h[i] > h[j] } // Max-Heap
func (h MaxHeap) Swap(i, j int)      { h[i], h[j] = h[j], h[i] }

func (h *MaxHeap) Push(x interface{}) {
	*h = append(*h, x.(int))
}

func (h *MaxHeap) Pop() interface{} {
	old := *h
	n := len(old)
	x := old[n-1]
	*h = old[0 : n-1]
	return x
}

func (h MinHeap) Len() int           { return len(h) }
func (h MinHeap) Less(i, j int) bool { return h[i] < h[j] } // Min-Heap
func (h MinHeap) Swap(i, j int)      { h[i], h[j] = h[j], h[i] }

func (h *MinHeap) Push(x interface{}) {
	*h = append(*h, x.(int))
}

func (h *MinHeap) Pop() interface{} {
	old := *h
	n := len(old)
	x := old[n-1]
	*h = old[0 : n-1]
	return x
}

func min64(a, b int64) int64 {
	if a < b {
		return a
	}
	return b
}

func minimumDifference(nums []int) int64 {
	sizeOfNums := len(nums)
	partitionSize := sizeOfNums / 3

	maxHeap := &MaxHeap{}
	heap.Init(maxHeap)

	minHeap := &MinHeap{}
	heap.Init(minHeap)

	var minSum, maxSum int64

	for i := 0; i < partitionSize; i++ {
		minSum += int64(nums[i])
		heap.Push(maxHeap, nums[i])
	}

	for i := 2 * partitionSize; i < sizeOfNums; i++ {
		maxSum += int64(nums[i])
		heap.Push(minHeap, nums[i])
	}

	partitionSum1 := make([]int64, partitionSize+1)
	partitionSum1[0] = minSum

	for i := partitionSize; i < 2*partitionSize; i++ {
		minSum += int64(nums[i])
		heap.Push(maxHeap, nums[i])
		minSum -= int64(heap.Pop(maxHeap).(int))
		partitionSum1[i-(partitionSize-1)] = minSum
	}

	minimumDiff := partitionSum1[partitionSize] - maxSum

	for i := 2*partitionSize - 1; i >= partitionSize; i-- {
		maxSum += int64(nums[i])
		heap.Push(minHeap, nums[i])
		maxSum -= int64(heap.Pop(minHeap).(int))
		minimumDiff = min64(minimumDiff, partitionSum1[i-partitionSize]-maxSum)
	}

	return minimumDiff
}