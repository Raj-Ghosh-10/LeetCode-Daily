impl Solution {
    pub fn largest_good_integer(num: String) -> String {
        let chars: Vec<char> = num.chars().collect();

        (0..chars.len().saturating_sub(2))
            .filter(|&i| chars[i] == chars[i+1] && chars[i] == chars[i+2])
            .map(|i| chars[i].to_digit(10).unwrap())
            .max()
            .map_or("".to_string(), |m| m.to_string().repeat(3))
    }
}