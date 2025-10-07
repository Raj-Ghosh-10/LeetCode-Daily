class Solution {
public:
    vector<int> avoidFlood(vector<int>& a) {
        int n = int(a.size());
        multiset<pair<int,int>>occ;
        multiset<int>zeros;
        vector<int>emp;
        vector<int>ans(n,-2);
        for(int i=0; i<n; i++){
            if( a[i] == 0 ) {
                zeros.insert(i);
            }
            else{
                ans[i] = -1;
                auto it = occ.lower_bound({a[i],0});
                occ.insert({a[i],i});
                // not found
                if( it == occ.end() ){ 
                    continue;
                }
                else if( it->first == a[i] ) {
                    auto it2 =  zeros.lower_bound(it->second);
                    if( it2 == zeros.end() ){
                        
                        return emp;
                    }
                    else{
                        ans[*(it2)] = (it->first);
                        zeros.erase(it2);
                        occ.erase(it);
                    }
                }
            }
        }
        for(int i=0; i<n; i++){
            if( ans[i] == -2 )ans[i] = 1;
        }
        return ans;
    }
};