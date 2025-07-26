/**
 * @param {number} n
 * @param {number[][]} conflictingPairs
 * @return {number}
 */
var maxSubarrays = function(n, conflictingPairs) {
  let validSub = 0;
  let maxLeft = 0, secondMax = 0;
  const gains = Array(n + 2).fill(0);        // gains[i]: extra valid subarrays if conflict at i removed
  const conflicts = Array.from({ length: n + 2 }, () => []);

  // Build conflicts: for pair (a, b), add min(a,b) to conflicts[max(a,b)]
  for (const [a, b] of conflictingPairs) {
    const r = Math.max(a, b), l = Math.min(a, b);
    conflicts[r].push(l);
  }

  // Greedy scan from right = 1..n
  for (let right = 1; right <= n; right++) {
    for (const l of conflicts[right]) {
      if (l > maxLeft) {
        secondMax = maxLeft;
        maxLeft = l;
      } else if (l > secondMax) {
        secondMax = l;
      }
    }
    // All subarrays ending at right and starting after maxLeft are valid
    validSub += right - maxLeft;
    // If we remove the constraint at maxLeft, we regain some subarrays
    gains[maxLeft] += maxLeft - secondMax;
  }

  // The best removal gives the max gain
  return validSub + Math.max(...gains);
};