use std::collections::HashMap;

impl Solution {
    pub fn min_subarray(nums: Vec<i32>, p: i32) -> i32 {
        let total: i64 = nums.iter().map(|&x| x as i64).sum();
        let need = (total % p as i64) as i32;
        if need == 0 { return 0; }

        let mut map = HashMap::new();
        map.insert(0, -1);
        let mut prefix: i32 = 0;
        let mut res = nums.len() as i32;

        for (i, &x) in nums.iter().enumerate() {
            prefix = (prefix + x) % p;
            let target = (prefix - need + p) % p;
            if let Some(&idx) = map.get(&target) {
                res = res.min(i as i32 - idx);
            }
            map.insert(prefix, i as i32);
        }

        if res == nums.len() as i32 { -1 } else { res }
    }
}