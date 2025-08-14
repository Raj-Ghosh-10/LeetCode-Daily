char* largestGoodInteger(char* num) {
    int len = strlen(num);
    char* str = (char*)malloc(4 * sizeof(char));
    int max = -1;
    for (int i = 0; i < len - 2; i++) {
        if (num[i] == num[i + 1] && num[i + 1] == num[i + 2]) {
            int curr_num = ((num[i] - '0') * 100) + ((num[i + 1] - '0') * 10) +
                           (num[i + 2] - '0');
            if (curr_num > max) {
                max = curr_num;
                str[0] = num[i];
                str[1] = num[i + 1];
                str[2] = num[i + 2];
                str[3] = '\0';
            }
        }
    }
    if(max == -1){
        return "";
    }
    return str;
}