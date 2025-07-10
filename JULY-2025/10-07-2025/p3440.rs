use std::cmp::max;

impl Solution {
    pub fn max_free_time(event_time: i32, start_time: Vec<i32>, end_time: Vec<i32>) -> i32 {
        let n = start_time.len();
        if n == 0 {
            return event_time;
        }

        let mut gaps = vec![0; n + 1];
        gaps[0] = start_time[0];
        for i in 1..n {
            gaps[i] = start_time[i] - end_time[i - 1];
        }
        gaps[n] = event_time - end_time[n - 1];

        let mut largest_right = vec![0; n + 1];
        for i in (0..n).rev() {
            largest_right[i] = max(largest_right[i + 1], gaps[i + 1]);
        }

        let mut max_free = 0;
        let mut largest_left = 0;

        for i in 1..=n {
            let duration = end_time[i - 1] - start_time[i - 1];
            let can_fit_left = largest_left >= duration;
            let can_fit_right = largest_right[i] >= duration;

            if can_fit_left || can_fit_right {
                let merged = gaps[i - 1] + gaps[i] + duration;
                max_free = max(max_free, merged);
            }

            max_free = max(max_free, gaps[i - 1] + gaps[i]);
            largest_left = max(largest_left, gaps[i - 1]);
        }

        max_free
    }
}