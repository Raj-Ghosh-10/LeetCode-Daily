impl Solution {
    pub fn max_events(events: Vec<Vec<i32>>) -> i32 {
        fn find(x: i32, f: &mut Vec<i32>) -> i32 {
            if f[x as usize] == x {
                x
            } else {
                f[x as usize] = find(f[x as usize], f);
                f[x as usize]
            }
        }

        let mut events = events;
        events.sort_by(|a, b| a[1].cmp(&b[1]));
        let mut f = vec![0; events[events.len() - 1][1] as usize + 2];
        for (i, item) in f.iter_mut().enumerate() {
            *item = i as i32;
        }
        let mut ans = 0;
        for it in events.iter() {
            let x = find(it[0], &mut f);
            if x <= it[1] {
                ans += 1;
                f[x as usize] = find(x + 1, &mut f);
            }
        }
        ans
    }
}