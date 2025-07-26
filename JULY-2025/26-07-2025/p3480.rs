impl Solution {
    pub fn max_subarrays(n: i32, mut conflicting_pairs: Vec<Vec<i32>>) -> i64 {
        use std::collections::BTreeSet;

        // Add dummy pair to simplify boundary handling
        conflicting_pairs.push(vec![n, n + 1]);

        // Normalize conflicting pairs to (min, max) and convert to 0-based indexing
        let mut conflicting_pairs = conflicting_pairs
            .into_iter()
            .map(|pair| {
                let a = pair[0] as usize - 1;
                let b = pair[1] as usize - 1;
                (a.min(b), a.max(b))
            })
            .collect::<Vec<_>>();

        // Sort by end first (ascending), then start (descending)
        conflicting_pairs.sort_unstable_by_key(|&(a, b)| (b, a));

        let mut starts = vec![];
        let mut ends = BTreeSet::new();

        // Build start and end data structures with original index for tracking
        for (i, &(a, b)) in conflicting_pairs.iter().enumerate() {
            starts.push((a, i));
            ends.insert((b, i));
        }

        // Sort starts in descending order so we can pop efficiently
        starts.sort_unstable();
        starts.reverse();

        let n = n as usize;
        let m = conflicting_pairs.len();

        let mut boost = vec![0; m];
        let mut all = 0;

        // Iterate through each starting point of potential subarrays
        for point in 0..n {
            // Remove all conflicts that start before the current point
            while let Some(&(a, ai)) = starts.last() {
                if a < point {
                    starts.pop();
                    ends.remove(&(conflicting_pairs[ai].1, ai));
                } else {
                    break;
                }
            }

            // Get the smallest ending point >= current point
            let mut it = ends.range((point, usize::MAX)..);
            let &(cur_end, ind) = it.next().unwrap();

            // Count valid subarrays starting at `point` and ending before `cur_end`
            all += cur_end - point;

            // Try boosting: see if skipping this interval allows more subarrays
            if let Some(&(next_end, _)) = it.next() {
                if next_end > cur_end {
                    boost[ind] += next_end - cur_end;
                }
            }
        }

        // Return total valid subarrays plus the best possible boost
        (all + boost.iter().max().unwrap_or(&0)) as i64
    }
}