#include <stdlib.h>
#include <string.h>

int cmp(const void *a, const void *b) {
    return strcmp(*(const char **)a, *(const char **)b);
}

char **removeSubfolders(char **folder, int folderSize, int *returnSize) {
    qsort(folder, folderSize, sizeof(char *), cmp);
    char **res = (char **)malloc(folderSize * sizeof(char *));
    int cnt = 0;
    for (int i = 0; i < folderSize; ++i) {
        if (cnt == 0 || strncmp(folder[i], res[cnt-1], strlen(res[cnt-1])) != 0 ||
            folder[i][strlen(res[cnt-1])] != '/')
        {
            res[cnt++] = folder[i];
        }
    }
    *returnSize = cnt;
    return res;
}