class Solution {
public:
    int longestSubarray(vector<int>& nums) {
        int n = nums.size();
        vector<int> zeroIdx;
        for(int i = 0; i < n; i++){
            if(nums[i] == 0){
                zeroIdx.push_back(i);
            }
        }

        if(zeroIdx.size() == 0)
        {
            return nums.size()-1;
        }
        int maxSize = 0;
        for(int i = 0; i < zeroIdx.size(); i++){
            int cntPre = 0, cntSuff = 0;
            for(int j = zeroIdx[i]-1; j >= 0; j--){
                if(nums[j] == 1){
                    cntPre++;
                }
                else{
                    break;
                }
            }

            for(int j = zeroIdx[i]+1; j < n; j++){
                if(nums[j] == 1){
                    cntSuff++;
                }
                else{
                    break;
                }
            }

            maxSize = max(maxSize, cntPre+cntSuff);
        }

        return maxSize;
    }
};