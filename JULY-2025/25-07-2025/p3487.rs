use itertools::Itertools;

impl Solution {
    pub fn max_sum(nums: Vec<i32>) -> i32 {
        let m = *nums.iter().max().unwrap();
        if m <= 0 {return  m;}
        nums.into_iter()
                        .filter(|x| *x > 0)
                        .counts()
                        .keys()
                        .sum::<i32>()
    }
}