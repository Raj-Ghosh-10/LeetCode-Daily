int maxSum(int* nums, int numsSize) {
    int res=0;
    int*hash = (int*)calloc(sizeof(int),202);
    for(int i=0;i<numsSize;i++){
        hash[nums[i]+100]++;
    }
    for(int i=100;i<202;i++){
        if(hash[i]>0){
            res+=i-100;
        }
    }
    if(res==0){
        for(int i=0;i<=100;i++){
        if(hash[i]>0){
            res=i-100;
        }
    }
    }
    return res;
}