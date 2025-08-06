use std::cmp;


impl Solution {

  fn update_group(group: &mut Vec<i32>, v: i32) -> i32 {
    let mut max_val = i32::MIN;
    let n = group.len();

    for i in 0..n {
      if group[i] >= v {
        group[i] = 0;
        
        for i in 0 .. n {
          if group[i] > max_val {
            max_val = group[i];
          }
        }
        return max_val;
      }
    }

    return max_val;
  }

  pub fn num_of_unplaced_fruits(fruits: Vec<i32>, baskets: Vec<i32>) -> i32 {
    let n = baskets.len();
    let m = (n as f64 / (n as f64).sqrt()).ceil() as usize;

    let mut groups: Vec<Vec<i32>> = Vec::new();
    for i in (0..n).step_by(m) {
      let end = cmp::min(i + m, n);
      groups.push(baskets[i..end].to_vec());
    }

    let mut maximums: Vec<i32> = groups.iter()
      .map(|g| *g.iter().max().unwrap_or(&0))
      .collect();

    let mut res = 0;

    for &v in &fruits {
      let mut is_found = false;

      for i in 0..maximums.len() {
        if maximums[i] >= v {
          is_found = true;
          maximums[i] = Self::update_group(&mut groups[i], v);
          break;
        }
      }

      if !is_found {
        res += 1;
      }
    }

    res
  }
}