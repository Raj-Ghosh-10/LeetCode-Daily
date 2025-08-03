impl Solution {
    pub fn max_total_fruits(f: Vec<Vec<i32>>, sp: i32, k: i32) -> i32 {
        let (mut q, mut s) = (0, 0);
        f.iter().map(|v| {
            while (sp + v[0] - 2*f[q][0]).min(2*v[0] - sp - f[q][0]) > k { s -= f[q][1]; q += 1 }
            if (v[0] - sp).abs() > k { q += 1; 0 } else { s += v[1]; s }
        }).max().unwrap()
    }

}