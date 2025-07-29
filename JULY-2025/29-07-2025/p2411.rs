use std::collections::*;

impl Solution {
  pub fn smallest_subarrays(nums: Vec<i32>) -> Vec<i32> {
    let n = nums.len();
    let mut result = vec![0;n];
    let mut memo = vec![VecDeque::new();35];

    for i in 0..n {
      let v = nums[i];
      for j in 0..35 {
        if v >> j & 1 == 1 {
          memo[j].push_back(i);
        }
      }
    }

    for i in 0..n {
      let mut max = i;
      for j in 0..35 {
        if !memo[j].is_empty() {
          max = max.max(memo[j][0]);

          if memo[j][0] == i {
            memo[j].pop_front();
          }
        }
      }

      result[i] = (max - i + 1) as i32;
    }

    result
  }
}