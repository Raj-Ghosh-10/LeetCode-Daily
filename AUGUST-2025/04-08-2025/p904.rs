impl Solution {
    pub fn total_fruit(f: Vec<i32>) -> i32 {
        let (mut p, mut k, mut j) = (-1, 0, 0);
        f.iter().enumerate().map(|(i, &t)| {
            if t != f[j] {
                if t != p { k = j }
                p = f[j]; j = i
            }
            i - k + 1
        }).max().unwrap() as _
    }

}