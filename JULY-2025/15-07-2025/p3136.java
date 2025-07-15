class Solution {
    public boolean isValid(String word) {
        int len = word.length(), vowel = 0, consonant = 0;

        if (len < 3)
            return false;

        for (int i = 0; i < len; i++) 
        {
            if (Character.isLetterOrDigit(word.charAt(i))) 
            {
                if (word.charAt(i) == 'A' || word.charAt(i) =='E' ||    word.charAt(i) == 'I' || word.charAt(i) == 'O' || word.charAt(i) == 'U' || word.charAt(i) == 'a' || word.charAt(i) == 'e' || word.charAt(i) == 'i' || word.charAt(i) == 'o' || word.charAt(i) == 'u')
                    vowel++;

                else if (word.charAt(i) < '0' || word.charAt(i) > '9')
                    consonant++;
            }

            else
                return false;
        }

        if (vowel != 0 && consonant != 0)
            return true;
        else
            return false;
    }
}