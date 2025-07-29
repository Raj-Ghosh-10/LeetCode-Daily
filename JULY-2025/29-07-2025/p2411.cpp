class Solution {
public:
    vector<int> smallestSubarrays(vector<int>& nums) {
        int n = nums.size();

        vector<int>prev(32,0);
        vector<int>curr(32,0);
        int maxOr =0;

        for(int i =0 ; i< n ; i++){

            updateInc(prev , nums[i], maxOr);
        }

        vector<int>ans(n , 0);

        int left =0;
        int currOr =0;

        for(int right = 0; right < n ;right++){
            updateInc(curr, nums[right],currOr);

            while(left<=right && maxOr == currOr){
                ans[left] = right - left +1;
                updateDec(prev, nums[left],maxOr);
                updateDec(curr, nums[left],currOr);
                left++;
            }

        }

        return ans;
    }

    private:
    void updateInc(vector<int>&arr, int ele, int &Or){
        Or |= ele;
        for(int i =0;i<32;i++){
            if(ele&(1<<i))arr[i]++;
        }
    }

    void updateDec(vector<int>&arr, int ele , int &Or){
         for(int i =0;i<32;i++){
            if(ele & (1<<i))
            {
            arr[i]--;
            if(arr[i]==0)Or -= (1<<i);
            }
         }
    }
};