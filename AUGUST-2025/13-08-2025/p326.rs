impl Solution {
    pub fn is_power_of_three(n: i32) -> bool {
        if n <= 0 {
            return false;
        }
        let x = (n as f64).ln() / 3f64.ln();
        let diff = (x - x.round()).abs();
        diff < 1e-10
    }
}