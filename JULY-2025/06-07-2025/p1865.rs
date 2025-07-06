use std::collections::HashMap;
struct FindSumPairs {
    nums2: Vec<i32>,
    counter_nums1: HashMap<i32, i32>,
    counter_nums2: HashMap<i32, i32>
}


/** 
 * `&self` means the method takes an immutable reference.
 * If you need a mutable reference, change it to `&mut self` instead.
 */
impl FindSumPairs {

    fn new(nums1: Vec<i32>, nums2: Vec<i32>) -> Self {
        let mut counter_nums2 = HashMap::new();
        let mut counter_nums1 = HashMap::new();

        for item in &nums1{
            *counter_nums1.entry(*item).or_insert(0) += 1;
        }
        for item in &nums2{
            *counter_nums2.entry(*item).or_insert(0) += 1;
        }
        Self {nums2, counter_nums1, counter_nums2}
    }
    
    fn add(&mut self, index: i32, val: i32) {
        let index = index as usize;
        let old_value = self.nums2[index];
        self.counter_nums2.entry(old_value).and_modify(|v| *v -= 1);
        *self.counter_nums2.entry(old_value+val).or_insert(0) += 1;
        self.nums2[index] += val;
    }
    
    fn count(&self, tot: i32) -> i32 {
        let mut count = 0;
        for (&key, &value) in self.counter_nums1.iter(){
            if let Some(v2) = self.counter_nums2.get(&{tot-key}){
                count += v2 * value;
            }
        } 
        return count
    }
}

/**
 * Your FindSumPairs object will be instantiated and called as such:
 * let obj = FindSumPairs::new(nums1, nums2);
 * obj.add(index, val);
 * let ret_2: i32 = obj.count(tot);
 */