impl Solution {
    pub fn max_value(events: Vec<Vec<i32>>, k: i32) -> i32 {
        let (n, k) = (events.len(), k as usize);
        let mut dp = vec![vec![-1; k]; n];
        let mut events = events;
        events.sort_by(|a, b| a[1].cmp(&b[1]));
        
        Self::eval(&mut dp, &events, n - 1,  k - 1)
    }
    
    fn eval(dp: &mut Vec<Vec<i32>>, events: &Vec<Vec<i32>>, i: usize, j: usize) -> i32 {
        if dp[i][j] != -1 { return dp[i][j] }
        
        dp[i][j] = events[i][2];
        if i == 0 { return dp[i][j] }
        
        dp[i][j] = dp[i][j].max(Self::eval(dp, events, i - 1, j));
        if j  == 0 { return dp[i][j] }
        
        let it = Self::binary_search(events, i);
        if it == -1 { return dp[i][j] }
        
        dp[i][j] = dp[i][j].max(events[i][2] + Self::eval(dp, events, it as usize, j - 1));
        
        dp[i][j]
    }
    
    fn binary_search(events: &Vec<Vec<i32>>,  i: usize) -> i32 {
        if events[0][1] >= events[i][0] { return -1 }
        
        let (mut left, mut right) = (0, i - 1);
        
        while left < right {
            let mid = right - (right - left) / 2;
            if events[mid][1] < events[i][0] { left = mid; }
            else                             { right = mid - 1; }
        }
        
        return left as i32
    }
}