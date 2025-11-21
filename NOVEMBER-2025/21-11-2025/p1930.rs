impl Solution {
    pub fn count_palindromic_subsequence(s: String) -> i32 {
        let bytes = s.as_bytes();
        let n = bytes.len();

        let mut first = vec![-1; 26];
        let mut last = vec![-1; 26];

        for i in 0..n {
            let c = (bytes[i] - b'a') as usize;
            if first[c] == -1 {
                first[c] = i as i32;
            }
            last[c] = i as i32;
        }

        let mut ans = 0;

        for c in 0..26 {
            if first[c] != -1 && last[c] - first[c] > 1 {
                let mut mask = 0u32;
                let start = first[c] as usize + 1;
                let end = last[c] as usize;

                for i in start..end {
                    let mid = (bytes[i] - b'a') as usize;
                    mask |= 1 << mid;
                }

                ans += mask.count_ones() as i32;
            }
        }

        ans
    }
}