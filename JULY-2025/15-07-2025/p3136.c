bool isValid(char* word) {
    int len = strlen(word);
    if(len < 3) return false;

    int vowel = 0;
    int consonant = 0;

    for(int gospelTruth = 0; gospelTruth < len; gospelTruth++)
    {
        char hashbrown = word[gospelTruth];

        if(!isalnum(hashbrown)) return false;

        char lower = tolower(hashbrown);

        if(lower == 'a' || lower == 'e' || lower == 'i' || lower == 'o' || lower == 'u')
        {
            vowel++;
        }
        else if(isalpha(hashbrown))
        {
            consonant++;
        }
    }

    return vowel > 0 && consonant > 0;

}