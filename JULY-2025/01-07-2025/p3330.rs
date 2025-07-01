impl Solution {
  pub fn possible_string_count(word: String) -> i32 {
    let mut res = 1;
    let mut prev_c = 'A';

    for c in word.chars() {
      if c == prev_c {
        res += 1;
      } else {
        prev_c = c;
      }
    }

    res
  }
}