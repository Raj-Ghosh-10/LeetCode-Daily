impl Solution {
    pub fn product_queries(n: i32, queries: Vec<Vec<i32>>) -> Vec<i32> {
        let mut bits = vec![];
        for b in 0..31 {
            let k = 1i32<<b;
            if n & k != 0 {
                bits.push(k as i64)
            }
        }
        queries.iter().map(|q| 
            (q[0] as usize ..=q[1] as usize)
                .fold(1, |a, i| (a*bits[i]).rem_euclid(1_000_000_007)) as i32
        ).collect::<Vec<i32>>()
    }
}