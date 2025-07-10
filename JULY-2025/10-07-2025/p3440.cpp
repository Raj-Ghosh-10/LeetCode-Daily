class Solution {
public:
    int maxFreeTime(int eventTime, vector<int>& startTime, vector<int>& endTime) {
        int n=startTime.size();
       
        vector<pair<int,int>> slots;
        vector<int> gaps;
        slots.push_back({startTime[0]-0,0});
        gaps.push_back(startTime[0]-0);
        int prev=endTime[0];
        for(int i=1; i<n;i++){
            int val=startTime[i]-prev;
            slots.push_back({val,i});
            gaps.push_back(val);
            prev=endTime[i];
        }

        slots.push_back({eventTime-prev,n});
        gaps.push_back(eventTime-prev);
        
        sort(slots.rbegin(),slots.rend());
        
        int ans=0;
        for(int i=0; i<n; i++){
             int meet_size=endTime[i]-startTime[i];
             for(int j=0; j<3; j++){
                int time=slots[j].first;
                int idx=slots[j].second;
                if(meet_size<=time){
                    if(idx!=i && idx!=(i+1))
                     {ans=max(ans, gaps[i]+gaps[i+1]+meet_size);}
                }
                 ans=max(ans, gaps[i]+gaps[i+1]);
             }
        }
        return ans;
    }
};