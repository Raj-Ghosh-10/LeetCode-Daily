const N = 1001;
const { max } = Math;

let fBL = new Int32Array(N); // Current state.
let gBL = new Int32Array(N); // Next state.

let fTR = new Int32Array(N); // Current state.
let gTR = new Int32Array(N); // Next state.

function maxCollectedFruits(fruits: number[][]): number {
  const n = fruits.length;
  const n_1 = n - 1;
  const half = (n + 1) >> 1;

  // Child (0, 0).
  let fTL = fruits[0][0];

  // Child (n - 1, 0).
  fBL.fill(0, 0, n + 1);
  gBL.fill(0, 0, n + 1);
  fBL[n_1] = fruits[n_1][0];

  // Child (0, n - 1).
  fTR.fill(0, 0, n + 1);
  gTR.fill(0, 0, n + 1);
  fTR[n_1] = fruits[0][n_1];

  for (let i = 1; i < n; ++i) {
    // Move child (0, 0) diagonally.
    fTL += fruits[i][i];

    if (i === n_1) break;

    for (let j = max(i, n_1 - i, half); j < n; ++j) {
      // Skip the TL-BR diagonal since it's covered by child (0, 0).
      if (i === j) continue;

      // Move child (n - 1, 0) within the bottom quadrant.
      gBL[j] = fruits[j][i] + max(fBL[j - 1], fBL[j], fBL[j + 1]);

      // Move child (0, n - 1) within the right quadrant.
      gTR[j] = fruits[i][j] + max(fTR[j - 1], fTR[j], fTR[j + 1]);
    }

    [fBL, gBL] = [gBL, fBL];
    [fTR, gTR] = [gTR, fTR];
  }

  return fTL + fBL[n_1] + fTR[n_1];
}