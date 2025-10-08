class Solution {
    public int lowerBound(int spell,long target,int[] arr){
        int n=arr.length;
        int low=0;
        int high=n-1;
        while(low<=high){
            int mid=(low+high)/2;
            if((long)spell*arr[mid] >=target){
                high=mid-1;
            }
            else low=mid+1;
        }
        return low;
    }

    public int[] successfulPairs(int[] spells, int[] potions, long success) {
        int n=spells.length;
        int m=potions.length;
        int [] result=new int[n];  
        Arrays.sort(potions);

        for(int i=0;i<n;i++){
            int ind=lowerBound(spells[i],success,potions);
            result[i]=m-ind;
        }
        return result;
    }
}