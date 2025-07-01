/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
int desc_compare(const void* a, const void* b){
    return (*(int(*)[2])b)[0] - (*(int(*)[2])a)[0];
}

int asc_compare(const void* a, const void* b){
    return *(int*)a - *(int*)b;
}

int* maxSubsequence(int* nums, int numsSize, int k, int* returnSize) {
    
    int key_value[numsSize][2];
    for(int i=0; i<numsSize; i++){
        key_value[i][0] = nums[i];
        key_value[i][1] = i;
    }
    qsort(key_value, numsSize, sizeof(key_value[0]), desc_compare);
    
    int *arr = malloc(sizeof(int)*(k+1));
    for(int i=0; i<k; i++){
        arr[i] = key_value[i][1];
    }

    qsort(arr, k, sizeof(int), asc_compare);
    for(int i=0; i<k; i++){
        arr[i] = nums[arr[i]];
    }

    *returnSize = k; 
    return arr;
}