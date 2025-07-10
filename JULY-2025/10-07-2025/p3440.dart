class Solution {
  int maxFreeTime(int eventTime, List<int> startTime, List<int> endTime) {
    int n = startTime.length;
    if (n == 0) return eventTime;

    List<int> gaps = List.filled(n + 1, 0);
    gaps[0] = startTime[0];

    for (int i = 1; i < n; i++) {
      gaps[i] = startTime[i] - endTime[i - 1];
    }
    gaps[n] = eventTime - endTime[n - 1];

    List<int> largestRight = List.filled(n + 1, 0);
    for (int i = n - 1; i >= 0; i--) {
      largestRight[i] = max(largestRight[i + 1], gaps[i + 1]);
    }

    int maxFreeTimeResult = 0;
    int largestLeft = 0;

    for (int i = 1; i < gaps.length; i++) {
      int meetingDuration = endTime[i - 1] - startTime[i - 1];
      bool canFitLeft = largestLeft >= meetingDuration;
      bool canFitRight = largestRight[i] >= meetingDuration;

      if (canFitLeft || canFitRight) {
        int merged = gaps[i - 1] + gaps[i] + meetingDuration;
        maxFreeTimeResult = max(maxFreeTimeResult, merged);
      }

      int current = gaps[i - 1] + gaps[i];
      maxFreeTimeResult = max(maxFreeTimeResult, current);
      largestLeft = max(largestLeft, gaps[i - 1]);
    }

    return maxFreeTimeResult;
  }
}