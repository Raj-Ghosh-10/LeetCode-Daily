impl Solution {
    pub fn generate(num_rows: i32) -> Vec<Vec<i32>> {
        if num_rows == 1 {vec![vec![1]]}
        else if num_rows == 2 {vec![vec![1], vec![1, 1]]}
        else {
            let mut v = vec![vec![1], vec![1, 1]];
            for  k in 3..=num_rows {
                let mut p = vec![1;k as usize];
                let t = v.last().unwrap();
                for i in 1..p.len()-1 {
                    p[i] = t[i-1] + t[i]
                }
                v.push(p);
            }
            v
        }
    }
}