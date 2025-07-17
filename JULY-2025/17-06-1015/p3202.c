int alternateStreak(int *n, int nSize, int x, int y) {
  register int i = 0, last = -1, streak = 0;
  for (; i < nSize; i++)
    if (n[i] != last && (n[i] == x || n[i] == y)) {
      last = n[i];
      streak++;
    }
  return (streak);
}

int maximumLength(int *nums, int numsSize, int k) {
  register int i, *n = NULL, *streaks = NULL;
  streaks = malloc(sizeof(int) * k);
  memset(streaks, 0, sizeof(int) * k);
  n = malloc(sizeof(int) * numsSize);
  for (i = 0; i < numsSize; i++) { // count streaks
    n[i] = nums[i] % k;
    streaks[n[i]]++;
  }
  register int out = 0;
  for (i = 0; i < k; i++) // find longest streak
    if (out < streaks[i]) {
      out = streaks[i];
    }
  register int j, alt;
  for (i = 0; i < k - 1; i++) {  // nested loop isO(½nk²) if we run 
    if (streaks[i] < out >> 1)   // the array every time so only  
      continue;                  // if a better result 
    for (j = i + 1; j < k; j++) {// is possible.
      if (streaks[i] + streaks[j] <= out)
        continue;
      if (out < (alt = alternateStreak(n, numsSize, i, j)))
        out = alt;
    }
  }
  free(n);
  free(streaks);
  return (out);
}