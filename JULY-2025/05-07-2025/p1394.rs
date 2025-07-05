use std::collections::HashMap;

impl Solution {
    pub fn find_lucky(arr: Vec<i32>) -> i32 {
        let mut counter = HashMap::new();
        
        for item in arr.iter() {
            *counter.entry(*item).or_insert(0) += 1;
        }

        counter.retain(|&k, &mut v| k == v);

        return *counter.values().max().unwrap_or(&-1)
    }
}