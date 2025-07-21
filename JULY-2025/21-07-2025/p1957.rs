impl Solution {
    pub fn make_fancy_string(s: String) -> String {
        let mut rslt = String::with_capacity(s.len());
        let mut k = 0;
        let mut current_char = '1';
        for i in s.chars() {
            if i != current_char {
                k = 0;
                rslt.push(i);
            }
            else if i == current_char && k < 1 {
                k += 1;
                rslt.push(i);
            }
            current_char = i;
        }
        rslt
    }
}