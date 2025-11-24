/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
bool* prefixesDivBy5(int* nums, int numsSize, int* returnSize) {
    *returnSize = numsSize;
    bool* ans = (bool*)malloc(numsSize * sizeof(bool));
    
    int mod = 0;
    for (int i = 0; i < numsSize; i++) {
        mod = (mod * 2 + nums[i]) % 5;
        ans[i] = (mod == 0);
    }
    
    return ans;
}