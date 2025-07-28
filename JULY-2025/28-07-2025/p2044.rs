impl Solution {
    pub fn count_max_or_subsets(nums: Vec<i32>) -> i32 {
        let max = nums.iter().fold(0, |acc, &x| acc | x);
        let mut result = 0;
        fn dfs(nums: &[i32], idx: usize, cur: i32, max: i32, result: &mut i32) {
            if idx == nums.len() {
                if cur == max {
                    *result += 1;
                }
                return;
            }

            dfs(nums, idx + 1, cur | nums[idx], max, result);
            dfs(nums, idx + 1, cur, max, result);
        }
        dfs(&nums[..], 0, 0, max, &mut result);
        result
    }
}