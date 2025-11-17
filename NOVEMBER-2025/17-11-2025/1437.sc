import scala.util.boundary
import scala.util.boundary.break

object Solution {
    def kLengthApart(nums: Array[Int], k: Int): Boolean = {
        boundary {
            var prev = -1
            for (i <- nums.indices) {
                if (nums(i) == 1) {
                    if (prev != -1 && (i - prev - 1) < k) {
                        break(false)
                    }
                    prev = i
                }
            }
            true
        }
    }
}