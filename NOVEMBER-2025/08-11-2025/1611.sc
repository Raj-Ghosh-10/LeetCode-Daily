object Solution {
    def minimumOneBitOperations(n: Int): Int = {
      def loop(num: Int, multiplier: Int, res: Int): Int =
        if (num == 0) math.abs(res)
        else loop(num & (num - 1), -1 * multiplier, res + (num ^ ((num - 1) * multiplier)))

      loop(n, 1, 0)
    }
}