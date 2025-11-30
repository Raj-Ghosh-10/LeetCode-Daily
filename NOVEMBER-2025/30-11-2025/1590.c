#include <stdlib.h>

typedef struct Node {
    int key, val;
    struct Node* next;
} Node;

#define SIZE 200003

int minSubarray(int* nums, int numsSize, int p) {
    Node* table[SIZE] = {0};
    long long total = 0, prefix = 0;
    for (int i = 0; i < numsSize; i++) total += nums[i];
    int need = total % p;
    if (need == 0) return 0;

    int res = numsSize;

    int idx = 0;
    int key = 0;
    Node* node = malloc(sizeof(Node));
    node->key = 0; node->val = -1; node->next = 0;
    table[0] = node;

    for (int i = 0; i < numsSize; i++) {
        prefix = (prefix + nums[i]) % p;
        int target = (prefix - need + p) % p;

        int h = target % SIZE;
        for (node = table[h]; node; node = node->next)
            if (node->key == target)
                res = (i - node->val < res ? i - node->val : res);

        h = prefix % SIZE;
        for (node = table[h]; node; node = node->next)
            if (node->key == prefix)
                break;

        if (!node) {
            Node* n = malloc(sizeof(Node));
            n->key = prefix; n->val = i; n->next = table[h];
            table[h] = n;
        } else {
            node->val = i;
        }
    }

    return res == numsSize ? -1 : res;
}