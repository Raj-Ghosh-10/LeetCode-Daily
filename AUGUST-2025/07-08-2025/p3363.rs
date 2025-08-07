impl Solution {
    pub fn max_collected_fruits(fruits: Vec<Vec<i32>>) -> i32 {
        let n = fruits.len();
        let mut res: i32 = (0..n).map(|i| fruits[i][i]).sum();

        let mut prev = vec![fruits[n - 1][0]];
        #[cfg(debug_assertions)]
        {
            println!("prev: {prev:?}");
        }
        for j in 1..n - 1 {
            let mut cur = vec![0; (j + 1).min(n - j - 1)];
            for i in 0..cur.len() {
                if i > 0 {
                    cur[i] = cur[i].max(prev[i - 1]);
                }
                if i < prev.len() {
                    cur[i] = cur[i].max(prev[i]);
                }
                if i + 1 < prev.len() {
                    cur[i] = cur[i].max(prev[i + 1]);
                }
                cur[i] += fruits[n - 1 - i][j];
            }
            prev = cur;
            #[cfg(debug_assertions)]
            {
                println!("prev: {prev:?}");
            }
        }
        res += prev[0];

        prev = vec![fruits[0][n - 1]];
        #[cfg(debug_assertions)]
        {
            println!("prev: {prev:?}");
        }
        for i in 1..n - 1 {
            let mut cur = vec![0; (i + 1).min(n - 1 - i)];
            for j in 0..cur.len() {
                if j > 0 {
                    cur[j] = cur[j].max(prev[j - 1]);
                }
                if j < prev.len() {
                    cur[j] = cur[j].max(prev[j]);
                }
                if j + 1 < prev.len() {
                    cur[j] = cur[j].max(prev[j + 1]);
                }
                cur[j] += fruits[i][n - 1 - j];
            }
            prev = cur;
            #[cfg(debug_assertions)]
            {
                println!("prev: {prev:?}");
            }
        }
        res += prev[0];

        res
    }
}