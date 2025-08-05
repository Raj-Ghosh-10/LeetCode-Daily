impl Solution {
    pub fn num_of_unplaced_fruits(fruits: Vec<i32>, mut baskets: Vec<i32>) -> i32 {
        fruits.into_iter().fold(0, |res, fruit| {
            if let Some(fit) = baskets.iter().position(|b| *b >= fruit) {
                baskets[fit] = 0;
                res
            } else {
                res + 1
            }
        })
    }
}