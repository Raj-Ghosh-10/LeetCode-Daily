int countHillValley(int* nums, int numsSize) {
    int count=0;
    for(int i=1;i<numsSize-1;i++){
        if(nums[i]==nums[i-1])
        continue;
        int j=i+1;
        while(j<numsSize && nums[i]==nums[j]){
            j++;
        }
        if(j==numsSize)
        break;

        if((nums[i-1]>nums[i]  && nums[j]>nums[i]) ||
            (nums[i-1]<nums[i] && nums[j]<nums[i]))
            count++;

    }
    return count;
}