impl Solution {
    pub fn prefixes_div_by5(nums: Vec<i32>) -> Vec<bool> {
        let mut ans = Vec::with_capacity(nums.len());
        let mut modulo = 0;

        for bit in nums {
            modulo = (modulo * 2 + bit) % 5;
            ans.push(modulo == 0);
        }

        ans
    }
}