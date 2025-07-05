public class Solution {
    public int FindLucky(int[] arr) {
		int n = arr.Length;
		int[] cnt = new int[500];
		foreach(int i in arr){
			cnt[i-1]++;
		}
		int res = -1;
		for(int i=0;i<500;i++){
			if(cnt[i] == i+1){
				res = i+1;
			}
		}
		return res;
    }
}