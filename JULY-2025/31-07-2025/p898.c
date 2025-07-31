#include <stdlib.h>
#include <stdbool.h>

int subarrayBitwiseORs(int* arr, int arrSize) {
    // allocate max possible sizes
    int maxK = 32;
    int *res = malloc(arrSize * maxK * sizeof(int));
    int resCount = 0;
    int *cur = malloc(maxK * sizeof(int));
    int curCount = 0;
    int *nxt = malloc(maxK * sizeof(int));
    int nxtCount;

    for (int i = 0; i < arrSize; i++) {
        int x = arr[i];
        nxtCount = 0;
        // start new subarray [x]
        nxt[nxtCount++] = x;
        // extend previous
        for (int j = 0; j < curCount; j++) {
            int val = cur[j] | x;
            // avoid duplicates in nxt
            bool seen = false;
            for (int k = 0; k < nxtCount; k++) {
                if (nxt[k] == val) { seen = true; break; }
            }
            if (!seen) nxt[nxtCount++] = val;
        }
        // add nxt to global res
        for (int j = 0; j < nxtCount; j++) {
            int v = nxt[j];
            bool seen = false;
            for (int k = 0; k < resCount; k++) {
                if (res[k] == v) { seen = true; break; }
            }
            if (!seen) res[resCount++] = v;
        }
        // swap cur and nxt
        curCount = nxtCount;
        for (int j = 0; j < curCount; j++) {
            cur[j] = nxt[j];
        }
    }

    free(cur);
    free(nxt);
    free(res);
    return resCount;
}  
// T L E