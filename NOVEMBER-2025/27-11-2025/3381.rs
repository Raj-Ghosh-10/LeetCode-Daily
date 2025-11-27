impl Solution {
    pub fn max_subarray_sum(nums: Vec<i32>, k: i32) -> i64 {
        let k = k as usize;
        let inf: i64 = i64::MAX;
        let mut min_prefix = vec![inf; k];
        min_prefix[0] = 0;

        let mut prefix: i64 = 0;
        let mut answer: i64 = i64::MIN;

        for (i, &x) in nums.iter().enumerate() {
            prefix += x as i64;
            let modulo = (i + 1) % k;

            if min_prefix[modulo] != inf {
                let candidate = prefix - min_prefix[modulo];
                if candidate > answer {
                    answer = candidate;
                }
            }

            if prefix < min_prefix[modulo] {
                min_prefix[modulo] = prefix;
            }
        }

        answer
    }
}