impl Solution {

    pub fn max_free_time(evt: i32, k: i32, st: Vec<i32>, et: Vec<i32>) -> i32 {
        let (mut sum, k) = (0, k as usize);
        (0..=st.len()).map(|i| {
            sum += if i < st.len() { st[i] } else { evt } - if i > 0 { et[i - 1] } else { 0 } -
            if i > k { st[i - k - 1] } else { 0 } + if i >= k + 2 { et[i - k - 2] } else { 0 };
            sum
        }).max().unwrap_or(0)
    }

}