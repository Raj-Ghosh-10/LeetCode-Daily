#define maxFreq 10001
int maximumUniqueSubarray(int* nums, int numsSize) {
    int* freq = calloc(maxFreq, sizeof(int));
    int sum = 0;    // Current Sum
    int maxSum = 0; // Max Sum
    int tail = 0, head = 0;
    for (head = 0; head < numsSize; head++) {
        sum += nums[head];
        freq[nums[head]]++;

        if (freq[nums[head]] != 0) {
            while (freq[nums[head]] > 1) {
                sum -= nums[tail];
                freq[nums[tail]]--;
                tail++;
            }
        }
        if (sum > maxSum) {
            maxSum = sum;
        }
    }
    free(freq);
    return maxSum;
}