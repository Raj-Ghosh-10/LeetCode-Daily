public class Solution {
    public int IntersectionSizeTwo(int[][] intervals) {
        Array.Sort(intervals, (a, b) => a[1] != b[1] ? a[1] - b[1] : b[0] - a[0]);
        int count = 0;
        int p1 = -1, p2 = -1;
        foreach (var iv in intervals) {
            int s = iv[0], e = iv[1];

            if (s > p2) {
                p1 = e - 1;
                p2 = e;
                count += 2;
            }
            else if (s > p1) {
                p1 = p2;
                p2 = e;
                count++;
            }
            else if (s <= p1) {
            }
        }
        return count;
    }
}