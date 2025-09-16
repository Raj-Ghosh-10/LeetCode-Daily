class Solution {
public:
    vector<int> replaceNonCoprimes(vector<int>& nums) {
        stack<int> st;
        st.push(nums[0]);
        
        for(int i=1 ; i < nums.size();i++){
             // calculate the st/top
             int b = nums[i];
             if(st.empty()==false && gcd(st.top(),b)<=1){
                st.push(nums[i]);

             }
             else{
                while(st.empty()==false && gcd(st.top(),b)>1){
                    int a = st.top();
                    st.pop();
                    b= lcm(a,b);
                }
                st.push(b);
             }
        }

        vector<int> ans;
        while(st.empty()==false){
            ans.push_back(st.top());
            st.pop();
        }
        reverse(ans.begin(),ans.end());
        return ans;
    }
};