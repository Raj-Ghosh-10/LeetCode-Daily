use itertools::Itertools;

impl Solution {
    pub fn max_subsequence(nums: Vec<i32>, k: i32) -> Vec<i32> {
        let (n, k) = (nums.len(), k as usize);
        if n == k {return nums;}
        nums.into_iter()
                        .enumerate()
                        .sorted_by_key(|x| x.1)
                        .tail(k)
                        .sorted_by_key(|x| x.0)
                        .map(|x| x.1)
                        .collect::<Vec<i32>>()
    }
}