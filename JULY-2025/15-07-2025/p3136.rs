use std::collections::HashSet;
impl Solution {
    pub fn is_valid(word: String) -> bool {
        if word.len() < 3 { return false }        
        let vowels:HashSet<char> = HashSet::from_iter(vec!['a','e','i','o','u']);      
        let consonants:HashSet<char> = HashSet::from_iter(
            vec!['b','c','d','f','g','h','j','k','l','m','n','p','q','r','s','t',
            'v','w','x','y','z']
        );
        let (mut has_vowel,mut has_consonant,word) = (false,false,word.to_lowercase());
        for ch in word.chars() {
            let b = ch as u8;
            if (b < 48 || (b > 57 && b < 65) || (b > 90 && b < 97) || b > 122) { return false }
            if !has_vowel && vowels.contains(&ch) { has_vowel = true } else {
                if !has_consonant && consonants.contains(&ch) { has_consonant = true }
            }
        }
        has_vowel && has_consonant
    }
}