impl Solution {
    pub fn min_cost(basket1: Vec<i32>, basket2: Vec<i32>) -> i64 {
        use std::cmp::Ordering;
        use std::collections::{BTreeSet, HashMap, VecDeque};

        let mut unique = BTreeSet::new();
        let mut cnt1 = HashMap::<i32, usize>::new();
        let mut cnt2 = HashMap::<i32, usize>::new();

        // Count fruit frequencies and collect unique fruit costs
        for &fruit in basket1.iter() {
            unique.insert(fruit);
            *cnt1.entry(fruit).or_default() += 1;
        }

        for &fruit in basket2.iter() {
            unique.insert(fruit);
            *cnt2.entry(fruit).or_default() += 1;
        }

        let mut from1 = VecDeque::new(); // Extra fruits in basket1
        let mut from2 = VecDeque::new(); // Extra fruits in basket2
        let best = unique.first().copied().unwrap(); // Smallest fruit cost

        // Identify how many of each fruit must be swapped
        for &fruit in unique.iter() {
            let in1 = cnt1.get(&fruit).copied().unwrap_or_default();
            let in2 = cnt2.get(&fruit).copied().unwrap_or_default();

            // If total count of a fruit is odd, impossible to balance
            if (in1 + in2) % 2 == 1 {
                return -1;
            }

            // Push the extra fruits to corresponding queues
            let dif = in1.abs_diff(in2) / 2;
            match in1.cmp(&in2) {
                Ordering::Less => from2.extend([fruit].repeat(dif)),
                Ordering::Greater => from1.extend([fruit].repeat(dif)),
                Ordering::Equal => {}
            }
        }

        let mut ans = 0;

        // Greedy pairing of extra fruits from both baskets
        while let (Some(&fruit1), Some(&fruit2)) = (from1.front(), from2.front()) {
            // If both fruits are expensive, consider double-swap via smallest fruit
            if fruit1.min(fruit2) > 2 * best {
                from1.push_front(best);
                from2.push_front(best);
                continue;
            }

            // Otherwise, swap them directly at minimal cost
            if fruit1 < fruit2 {
                ans += fruit1 as i64;
                from1.pop_front();
                from2.pop_back();
            } else {
                ans += fruit2 as i64;
                from2.pop_front();
                from1.pop_back();
            }
        }

        ans
    }
}