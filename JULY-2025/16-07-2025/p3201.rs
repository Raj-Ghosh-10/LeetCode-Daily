impl Solution {
    pub fn maximum_length(nums: Vec<i32>) -> i32 {
        let a = nums
            .iter()
            .fold([0, 0, 0, nums[0] & 1], |[odd, even, flip, last], n| {
                let curr = n & 1;
                [
                    odd + curr,
                    even + (1 - curr),
                    flip + (last ^ curr),
                    last ^ (last ^ curr),
                ]
            });
        a[0].max(a[1].max(a[2] + 1))
    }
}