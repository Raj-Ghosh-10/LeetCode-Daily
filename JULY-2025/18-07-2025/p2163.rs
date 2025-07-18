use std::{cmp::Reverse, collections::BinaryHeap};

impl Solution {
    pub fn minimum_difference(nums: Vec<i32>) -> i64 {
        let n = nums.len() / 3;
        let mut prefsum: i64 = nums[..n].into_iter().map(|n| *n as i64).sum();
        let mut prefheap = BinaryHeap::from_iter(nums[..n].into_iter().map(|n| *n as i64));
        let mut prefsumcollect = vec![prefsum];
        for &i in &nums[n..n * 2] {
            let i = i as i64;
            if i < *prefheap.peek().unwrap() {
                let l = prefheap.pop().unwrap();
                prefheap.push(i);
                prefsum -= l;
                prefsum += i;
            }
            prefsumcollect.push(prefsum);
        }
        #[cfg(debug_assertions)]
        {
            println!("prefsumcollect: {prefsumcollect:?}");
        }

        let mut sufsum: i64 = nums[2 * n..].into_iter().map(|n| *n as i64).sum();
        #[cfg(debug_assertions)]
        {
            println!("sufsum:{sufsum}");
        }
        let mut sufheap =
            BinaryHeap::from_iter(nums[2 * n..].into_iter().map(|n| Reverse(*n as i64)));
        let mut res = prefsumcollect[n] - sufsum;
        for i in (n..2 * n).rev() {
            let j = nums[i] as i64;
            if j > sufheap.peek().unwrap().0 {
                let l = sufheap.pop().unwrap().0;
                sufheap.push(Reverse(j));
                sufsum -= l;
                sufsum += j;
            }
            #[cfg(debug_assertions)]
            {
                println!("sufsum:{sufsum}");
            }
            res = res.min(prefsumcollect[i - n] - sufsum);
        }

        res
    }
}