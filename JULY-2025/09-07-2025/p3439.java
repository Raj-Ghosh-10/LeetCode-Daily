import java.util.*;
class Solution {
    public int maxFreeTime(int eventTime, int k, int[] startTime, int[] endTime) {
        ArrayList<Integer> list = new ArrayList<>();
         list.add(startTime[0]);
        for(int i=1;i<startTime.length;i++){
           list.add(startTime[i]-endTime[i-1]);
        }
        list.add(eventTime - endTime[endTime.length-1]);
        int i=0;
        int j=0;
        int maxSum = 0;
        int currSum = 0;
        int n = list.size();
        while(j<n){
            currSum+= list.get(j);

            if(i<n && (j-i+1) > k+1){
                currSum -= list.get(i);
                i++;
            }

            maxSum = Math.max(maxSum, currSum);
            j++;
        }
        return maxSum;
    }
}