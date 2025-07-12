impl Solution {
    pub fn earliest_and_latest(n: i32, first_player: i32, second_player: i32) -> Vec<i32> {
        let mut mn = 10000;
        let mut mx = 0;

        let mut arr = vec![0; n as usize];
        for i in 1..=n {
            arr[i as usize - 1] = i;
        }
        Solution::dfs(&arr, 1, &mut mn, &mut mx, first_player, second_player);
        vec![mn, mx]
    }

    fn dfs(arr: &Vec<i32>, round: i32, mn: &mut i32, mx: &mut i32, first: i32, second: i32) {
        let size = arr.len() / 2;
        if arr.len() == 1 {
            return;
        }
        for i in 0..size {
            if arr[i] == first && arr[arr.len() - i - 1] == second {
                *mn = (*mn).min(round);
                *mx = (*mx).max(round);
                return;
            }
        }
        let mut f1 = false;
        let mut f2 = false;
        for n in arr {
            f1 |= *n == first;
            f2 |= *n == second;
        }
        if !f1 || !f2 {
            return;
        }
        let mut nextarr = vec![0; size + (arr.len() % 2)];
        let m = (1 << size) - 1;
        for i in 0..=m {
            let mut left = 0_i32;
            let mut right = nextarr.len() as i32 - 1;
            for j in 0..size {
                if (1 << j) & i != 0 {
                    nextarr[left as usize] = arr[j];
                    left += 1;
                } else {
                    nextarr[right as usize] = arr[arr.len() - j - 1];
                    right -= 1;
                }
            }
            if arr.len() % 2 != 0 {
                nextarr[left as usize] = arr[arr.len() / 2];
            }
            Solution::dfs(&nextarr, round + 1, mn, mx, first, second);
        }
    }
}