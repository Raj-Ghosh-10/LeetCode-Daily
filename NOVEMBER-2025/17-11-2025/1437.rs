impl Solution {
    pub fn k_length_apart(nums: Vec<i32>, k: i32) -> bool {
        let mut prev: i32 = -1;
        for (i, &val) in nums.iter().enumerate() {
            if val == 1 {
                if prev != -1 && (i as i32 - prev - 1) < k {
                    return false;
                }
                prev = i as i32;
            }
        }
        return true;
    }
}