type FindSumPairs struct {
  nums1, nums2 []int
  count map[int]int
}


func Constructor(nums1 []int, nums2 []int) FindSumPairs {
  count := make(map[int]int)
  for _, num := range nums2 {
    count[num]++
  }

  return FindSumPairs{
    nums1: nums1,
    nums2: nums2,
    count: count,
  }
}


func (f *FindSumPairs) Add(index int, val int)  {
  prevVal := f.nums2[index]
  f.count[prevVal]--

  newVal := prevVal+val
  f.count[newVal]++
  f.nums2[index] = newVal
}


func (f *FindSumPairs) Count(tot int) int {
  total := 0
  for _, num := range f.nums1 {
    if num > tot {
      continue
    }

    diff := tot-num
    if amount, ok := f.count[diff]; ok && amount > 0 {
      total+=amount
    }
  }

  return total
}


/**
 * Your FindSumPairs object will be instantiated and called as such:
 * obj := Constructor(nums1, nums2);
 * obj.Add(index,val);
 * param_2 := obj.Count(tot);
 */