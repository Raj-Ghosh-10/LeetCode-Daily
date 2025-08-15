impl Solution {
    pub fn is_power_of_four(n: i32) -> bool {
        n > 0 && 1073741824 % n == 0 && n.ilog2() % 2 == 0
    }
}