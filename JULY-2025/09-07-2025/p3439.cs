public class Solution {
    public int MaxFreeTime(int eventTime, int k, int[] startTime, int[] endTime) {
        var freeTime = new List<int>();
        int currEnd = 0,n=startTime.Length;
        for(int i=0;i<n;i++){
            freeTime.Add(startTime[i]-currEnd);
            currEnd=endTime[i];
        }
        freeTime.Add(eventTime-endTime[n-1]);

        //Sliding wind
        int l=0,res=0,curr=0;
        for(int r=0;r<freeTime.Count;r++){
            if(r-l+1>k+1){
                curr -= freeTime[l];
                l++;
            }
            curr += freeTime[r];
            res = Math.Max(res,curr);
        }
        return res;
    }
}