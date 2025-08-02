#define MIN(a, b)   ((a < b) ? a : b)
int cmp(const void* a, const void* b) {
    return *(int*)a - *(int*)b;
}
long long minCost(int* basket1, int b1sz, int* basket2, int b2sz) {
    qsort(basket1, b1sz, sizeof(int), cmp);
    qsort(basket2, b2sz, sizeof(int), cmp);
    int minCost = MIN(basket1[0], basket2[0]);
    minCost <<= 1;
    int i = 0, j = 0; // index i of basket1, index j of basket2
    int si = 0, sj = 0; // shift index i of basket1, shift index j of basket2
    while (i < b1sz && j < b2sz) {
        if (basket1[i] == basket2[j]) {
            ++i;
            ++j;
        }
        else if (basket1[i] < basket2[j]) {
            if (i == b1sz - 1 || basket1[i] != basket1[i+1]) return -1;
            basket1[si++] = basket1[i];
            i+=2;
        }
        else {
            if (j == b2sz - 1 || basket2[j] != basket2[j+1]) return -1;
            basket2[sj++] = basket2[j];
            j+=2;
        }
    }

    while (i < b1sz) {
        if (basket1[i] != basket1[i+1]) return -1;
        basket1[si++] = basket1[i];
        i+=2;
    }

    while (j < b2sz) {
        if (basket2[j] != basket2[j+1]) return -1;
        basket2[sj++] = basket2[j];
        j+=2;
    }

    long long resCost = 0;
    for (i = 0; i < si; ++i) resCost += MIN(MIN(basket1[i], basket2[si-1-i]), minCost);
    return resCost;
}