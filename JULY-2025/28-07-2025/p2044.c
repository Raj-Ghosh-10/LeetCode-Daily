int backtrack(int* nums, int n, int i, int curOr, int tarOr) {
    if (curOr == tarOr) return 1 << (n - i);
    int count = 0;
    for (; i < n; ++i) count += backtrack(nums, n, i+1, curOr | nums[i], tarOr);
    return count;
}

int countMaxOrSubsets(int* nums, int n) {
    int maxOr = 0;
    for (int i = 0; i < n; ++i) maxOr |= nums[i];
    return backtrack(nums, n, 0, 0, maxOr);
}