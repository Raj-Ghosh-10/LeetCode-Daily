#include <stdio.h>
#include <stdlib.h>

#define LL long long
#define min(a, b) ((a) < (b) ? (a) : (b))

void pushMax(int* heap, int* size, int val) {
    int i = (*size)++;
    while (i > 0) {
        int p = (i - 1) / 2;
        if (heap[p] >= val) break;
        heap[i] = heap[p];
        i = p;
    }
    heap[i] = val;
}

int popMax(int* heap, int* size) {
    int ret = heap[0];
    int val = heap[--(*size)];
    int i = 0;
    while (2 * i + 1 < *size) {
        int j = 2 * i + 1;
        if (j + 1 < *size && heap[j + 1] > heap[j]) j++;
        if (heap[j] <= val) break;
        heap[i] = heap[j];
        i = j;
    }
    heap[i] = val;
    return ret;
}

void pushMin(int* heap, int* size, int val) {
    int i = (*size)++;
    while (i > 0) {
        int p = (i - 1) / 2;
        if (heap[p] <= val) break;
        heap[i] = heap[p];
        i = p;
    }
    heap[i] = val;
}

int popMin(int* heap, int* size) {
    int ret = heap[0];
    int val = heap[--(*size)];
    int i = 0;
    while (2 * i + 1 < *size) {
        int j = 2 * i + 1;
        if (j + 1 < *size && heap[j + 1] < heap[j]) j++;
        if (heap[j] >= val) break;
        heap[i] = heap[j];
        i = j;
    }
    heap[i] = val;
    return ret;
}

long long minimumDifference(int* nums, int numsSize) {
    int n = numsSize / 3;
    LL* leftSum = malloc((n + 1) * sizeof(LL));
    LL* rightSum = malloc((n + 1) * sizeof(LL));
    int* maxHeap = malloc((2 * n) * sizeof(int));
    int* minHeap = malloc((2 * n) * sizeof(int));
    int maxSize = 0, minSize = 0;
    LL sum = 0;

    for (int i = 0; i < n; i++) {
        sum += nums[i];
        pushMax(maxHeap, &maxSize, nums[i]);
    }
    leftSum[0] = sum;

    for (int i = n; i < 2 * n; i++) {
        sum += nums[i];
        pushMax(maxHeap, &maxSize, nums[i]);
        sum -= popMax(maxHeap, &maxSize);
        leftSum[i - n + 1] = sum;
    }

    sum = 0;
    for (int i = 0; i < n; i++) {
        int idx = numsSize - 1 - i;
        sum += nums[idx];
        pushMin(minHeap, &minSize, nums[idx]);
    }
    rightSum[n] = sum;

    for (int i = n; i < 2 * n; i++) {
        int idx = numsSize - 1 - i;
        sum += nums[idx];
        pushMin(minHeap, &minSize, nums[idx]);
        sum -= popMin(minHeap, &minSize);
        rightSum[2 * n - i - 1] = sum;
    }

    LL ans = leftSum[0] - rightSum[0];
    for (int i = 0; i <= n; i++) {
        if (leftSum[i] - rightSum[i] < ans)
            ans = leftSum[i] - rightSum[i];
    }

    free(leftSum);
    free(rightSum);
    free(maxHeap);
    free(minHeap);
    return ans;
}