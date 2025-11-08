/**
 * @param {number} n
 * @return {number}
 */
var minimumOneBitOperations = function (n) {
  let ans = n;

  for (let i = 16; i >= 1; i /= 2) {
    ans ^= ans >> i
  }
  return ans;
};