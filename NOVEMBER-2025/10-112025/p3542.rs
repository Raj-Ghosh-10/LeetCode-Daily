const N: usize = 100_000;

impl Solution {
    pub fn min_operations(nums: Vec<i32>) -> i32 {
        let n = nums.len();
		let mut stk = [0; N];
		let mut m = 0;
		let mut ans = 0;

		for x in nums {
			while m > 0 && stk[m-1] > x {
				ans += 1;
				m -= 1;
			}
			if x != 0 && (m <= 0 || stk[m-1] < x) {
				stk[m] = x;
				m += 1;
			}
		}

		ans += m;

		ans as i32
    }
}