impl Solution {
    pub fn maximum_gain(s: String, x: i32, y: i32) -> i32 {
        if x > y {
            Self::remove_pairs(&s, 'a', 'b', x, y)
        } else {
            Self::remove_pairs(&s, 'b', 'a', y, x)
        }
    }
    fn remove_pairs(s: &str, first_char: char, second_char: char, first_val: i32, second_val: i32) -> i32 {
        let mut stack = Vec::new();
        let mut points = 0;
        for c in s.chars() {
            if let Some(&last) = stack.last() {
                if last == first_char && c == second_char {
                    stack.pop();
                    points += first_val;
                    continue;
                }
            }
            stack.push(c);
        }
        let mut new_stack = Vec::new();
        for c in stack {
            if let Some(&last) = new_stack.last() {
                if last == second_char && c == first_char {
                    new_stack.pop();
                    points += second_val;
                    continue;
                }
            }
            new_stack.push(c);
        }
        points
    }
}