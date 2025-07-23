int removeSubstring(char *s, char first, char second, int *score) {
    int len = strlen(s);
    char *stack = (char *)malloc((len + 1) * sizeof(char));
    int top = -1;
    int points = 0;
    
    for (int i = 0; i < len; i++) {
        if (top >= 0 && stack[top] == first && s[i] == second) {
            top--;
            points += (*score);
        } else {
            stack[++top] = s[i];
        }
    }
    
    stack[++top] = '\0';
    strcpy(s, stack);
    free(stack);
    return points;
}

int maximumGain(char* s, int x, int y) {
    char *s_copy1 = strdup(s);
    char *s_copy2 = strdup(s);
    int score1 = 0, score2 = 0;
    
    if (x >= y) {
        score1 += removeSubstring(s_copy1, 'a', 'b', &x);
        score1 += removeSubstring(s_copy1, 'b', 'a', &y);
    } else {
        score1 += removeSubstring(s_copy1, 'b', 'a', &y);
        score1 += removeSubstring(s_copy1, 'a', 'b', &x);
    }

    free(s_copy1);
    free(s_copy2);
    
    return score1;
}