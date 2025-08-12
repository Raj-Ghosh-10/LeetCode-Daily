impl Solution {
  pub fn number_of_ways(n: i32, x: i32) -> i32 {
    let mut vals = Vec::new();
    let mut i: i32 = 1;
    while i.pow(x as u32) <= n {
      vals.push(i.pow(x as u32));
      i += 1;
    }

    let mod_val = 1000000007;
    let mut dp = vec![0; (n + 1) as usize];
    dp[0] = 1;

    for v in vals {
      for v_prev in (0..=(n - v)).rev() {
        dp[(v_prev + v) as usize] = (dp[(v_prev + v) as usize] + dp[v_prev as usize]) % mod_val;
      }
    }

    dp[n as usize]
  }
}