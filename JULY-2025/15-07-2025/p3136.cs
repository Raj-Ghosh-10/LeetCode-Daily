public class Solution {
    public bool IsValid(string word)
    {
        if (word.Length < 3) return false;

        bool hasVowel = false;
        bool hasCons = false;


        foreach (var c in word)
        {
            if (!char.IsAsciiLetterOrDigit(c)) return false;

            if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u' || 
                c == 'A' || c == 'E' || c == 'I' || c == 'O' || c == 'U')
            {
                hasVowel = true;
            }
            else
            {
                if (char.IsLetter(c)) hasCons = true;
            }
        }

        return hasVowel && hasCons;
    }
}