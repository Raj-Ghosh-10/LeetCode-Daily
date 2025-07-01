use std::collections::HashMap;
use std::cmp::max;

impl Solution {
    pub fn find_lhs(nums: Vec<i32>) -> i32 {
        let mut freq = HashMap::new();
        for &num in &nums {
            *freq.entry(num).or_insert(0) += 1;
        }

        let mut ans = 0;
        for &key in freq.keys() {
            if let Some(&val) = freq.get(&(key + 1)) {
                ans = max(ans, freq[&key] + val);
            }
        }

        ans
    }
}