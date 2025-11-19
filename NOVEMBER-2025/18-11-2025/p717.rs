impl Solution {
    pub fn is_one_bit_character(bits: Vec<i32>) -> bool {
        let mut bits = bits.into_iter();
        let mut last_zero = false;
        while let Some(b) = bits.next() {
            if b == 0 {
                last_zero = true;
                continue;
            }
            last_zero = false;
            bits.next();
        }
        last_zero
    }
}