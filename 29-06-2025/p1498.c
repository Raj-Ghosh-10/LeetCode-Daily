#define MOD 1000000007

void merge(int* nums, int left, int mid, int right) {
    int i = 0, j = 0, k = 0;
    int tmp = mid - left + 1;
    int tmp2 = right - mid;

    int arr1[tmp], arr2[tmp2];
    for(; i < tmp; i++) {
        arr1[i] = nums[left + i];
    }
    for(; j < tmp2; j++) {
        arr2[j] = nums[mid + j + 1];
    }
    i = 0;
    j = 0;
    k = left;
    while (i < tmp && j < tmp2) {
        if (arr1[i] <= arr2[j]) {
            nums[k] = arr1[i];
            i++;
        } else {
            nums[k] = arr2[j];
            j++;
        }
        k++;
    }
    while (i < tmp) {
        nums[k] = arr1[i];
        i++;
        k++;
    }
    while (j < tmp2) {
        nums[k] = arr2[j];
        j++;
        k++;
    }
}

void mergeSort(int* nums, int left, int right) {
    if (left < right) {
        int mid = left + (right - left) / 2;

        mergeSort(nums, left, mid);
        mergeSort(nums, mid + 1, right);
        merge(nums, left, mid, right);
    }
}

int numSubseq(int* nums, int numsSize, int target) {
    mergeSort(nums, 0, numsSize-1);
    long res = 0, power[numsSize];
    int left = 0, right = numsSize - 1;
    power[0] = 1;
    for(int i = 1; i < numsSize; i++) {
        power[i] = power[i - 1] * 2 % MOD;
    }
    while(left <= right) {
        if(nums[left] + nums[right] > target) right--;
        else {
            res += (power[right - left]);
            res %= MOD;
            left++;
        }
    }

    return res;
}