class Solution {
    public int maxFreeTime(int eventTime, int[] startTime, int[] endTime) {
        int n = startTime.length;
        if (n == 1) {
            return eventTime - (endTime[0] - startTime[0]);
        }
        int[] gaps = new int[n + 1];
        gaps[0] = startTime[0];
        for (int i = 1; i < n; i++) {
            gaps[i] = startTime[i] - endTime[i - 1];
        }
        gaps[n] = eventTime - endTime[n - 1];
        int[] maxLeft = new int[n + 1];
        int[] maxRight = new int[n + 1];
        maxLeft[0] = gaps[0];
        for (int i = 1; i < n; i++) {
            maxLeft[i] = Math.max(maxLeft[i - 1], gaps[i]);
        }
        maxRight[n] = 0;
        for (int i = n - 1; i >= 0; i--) {
            maxRight[i] = Math.max(maxRight[i + 1], gaps[i + 1]);
        }
        int maxFree = 0;
        int firstDuration = endTime[0] - startTime[0];
        if (maxRight[1] >= firstDuration) {
            maxFree = Math.max(maxFree, gaps[0] + gaps[1] + firstDuration);
        }
        maxFree = Math.max(maxFree, gaps[0] + gaps[1]);
        for (int i = 1; i < n; i++) {
            int duration = endTime[i] - startTime[i];
            if (maxLeft[i - 1] >= duration || maxRight[i + 1] >= duration) {
                maxFree = Math.max(maxFree, gaps[i] + gaps[i + 1] + duration);
            }
            maxFree = Math.max(maxFree, gaps[i] + gaps[i + 1]);
        }
        return maxFree;
    }
}