function isPowerOfThree(n: number): boolean {
  return n > 0 && (3 ** 19) % n === 0;
}