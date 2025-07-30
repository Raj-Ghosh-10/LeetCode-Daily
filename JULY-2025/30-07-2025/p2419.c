int longestSubarray(int* nums, int numsSize) {
    int i,c=0,grt=0,f=0;
    for(i=0;i<numsSize;i++)
    if(nums[i]>grt)
    grt=nums[i];
    for(i=0;i<numsSize;i++)
    {
        if(nums[i]==grt)
        {
            f++;
            if(f>c)
                c=f;
        }
        else 
        f=0;

    }
    return c;
}