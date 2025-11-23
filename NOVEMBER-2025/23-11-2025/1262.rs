impl Solution {
    pub fn max_sum_div_three(nums: Vec<i32>) -> i32 {
        let mut sum = 0;

        let mut m1a = i32::MAX;
        let mut m1b = i32::MAX;
        let mut m2a = i32::MAX;
        let mut m2b = i32::MAX;

        for x in nums {
            sum += x;
            let r = x % 3;

            if r == 1 {
                if x < m1a {
                    m1b = m1a;
                    m1a = x;
                } else if x < m1b {
                    m1b = x;
                }
            } else if r == 2 {
                if x < m2a {
                    m2b = m2a;
                    m2a = x;
                } else if x < m2b {
                    m2b = x;
                }
            }
        }

        let rem = sum % 3;
        if rem == 0 {
            return sum;
        }

        let mut remove = i32::MAX;

        if rem == 1 {
            let opt1 = m1a;
            let opt2 = if m2b < i32::MAX { m2a + m2b } else { i32::MAX };
            remove = opt1.min(opt2);
        } else {
            let opt1 = m2a;
            let opt2 = if m1b < i32::MAX { m1a + m1b } else { i32::MAX };
            remove = opt1.min(opt2);
        }

        if remove == i32::MAX {
            0
        } else {
            sum - remove
        }
    }
}