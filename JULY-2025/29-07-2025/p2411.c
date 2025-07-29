#define BITS 31

/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
int* smallestSubarrays(int* nums, int numsSize, int* returnSize) {
    int* result=malloc((*returnSize=numsSize)*sizeof(int));
    int bits[BITS]={0};

    for(int i=numsSize-1, j, max; i>=0; i--) {
        for(j=0, max=i+1; j<BITS; j++) {
            bits[j]=nums[i]&(1<<j)?i+1:bits[j];
            max=max>=bits[j]?max:bits[j];
        } result[i]=max-i;
    }

    return result;
}