object Solution {
    def countHillValley(nums: Array[Int]): Int = {
        val (j, _) = nums.tail.foldLeft((1, nums.head)) {
            case ((j, prev), value) =>
                if (prev != value) {
                    nums(j) = value
                    (j + 1, value)
                } else (j, value)
        }
        
        nums.take(j).drop(2).foldLeft((0, nums(0), nums(1))) {
            case ((count, v1, v2), v3) =>
                if ((v2 > v1 && v2 > v3) || (v2 < v1 && v2 < v3))
                    (count + 1, v2, v3)
                else (count, v2, v3)
        }._1
    }
}