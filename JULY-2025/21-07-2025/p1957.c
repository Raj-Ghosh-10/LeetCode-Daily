int calculateFancyLength(char *s) {
    int len = 0;
    for (int i = 0; s[i]; ) {
        char current = s[i];
        int count = 0;
        while (s[i] && s[i] == current) {
            count++;
            i++;
        }        
        len += (count > 2) ? 2 : count;
    }
    return len;
}

char* makeFancyString(char* s) {
    int fancy_len = calculateFancyLength(s);
    char *new = malloc(fancy_len + 1);
    int j = 0;
    
    for (int i = 0; s[i]; ) {
        char current = s[i];
        int count = 0;
        while (s[i] && s[i] == current) {
            count++;
            i++;
        }
        int add = (count > 2) ? 2 : count;
        while (add-- > 0) {
            new[j++] = current;
        }
    }
    
    new[j] = '\0';
    return new;
}