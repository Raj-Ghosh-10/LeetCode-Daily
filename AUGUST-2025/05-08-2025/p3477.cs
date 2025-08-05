public class Solution {
    public int NumOfUnplacedFruits(int[] fruits, int[] baskets) {
        int n = baskets.Length;
        bool[] vis = new bool[n];
        int cnt = 0;

        foreach(int i in fruits) {
            bool placed = false;
            for(int j = 0; j < baskets.Length; j++) {
                if(!vis[j] && baskets[j] >= i) {
                    vis[j] = true;
                    placed = true;
                    break;
                }
            }
            if(!placed){
                cnt++;
            }
        }
        return cnt;
    }
}