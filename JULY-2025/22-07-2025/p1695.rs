impl Solution {
    pub fn maximum_unique_subarray(nums: Vec<i32>) -> i32 {
        let mut i = 0;
        let mut set= vec![false; 10000];
        let mut res = 0;
        let mut sum = 0;
        for j in 0..nums.len() {
            while set[nums[j] as usize -1] {
                set[nums[i] as usize -1]=false;
                sum -= nums[i];
                i += 1;
            }
            sum += nums[j];
            set[nums[j] as usize -1]=true;
            res = res.max(sum);
        }
        res
    }
}