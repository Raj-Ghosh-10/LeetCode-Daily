use std::collections::HashSet;
use std::iter::once;

impl Solution {
    pub fn subarray_bitwise_o_rs(arr: Vec<i32>) -> i32 {

        let mut res  = HashSet::<i32>::new();
        let mut cur = HashSet::new();

        for &x in &arr {
            cur = cur.iter().map(|&y| y | x).chain(once(x)).collect();
            res.extend(&cur);
        }

        res.len() as _
    }
}