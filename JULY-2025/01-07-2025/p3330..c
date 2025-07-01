int possibleStringCount(char* word) {
    int len = strlen(word);
    int branch = len;

    for(int i=1; i<len; i++){
        branch-=(word[i]!=word[i-1]);
    }
    return branch;
}