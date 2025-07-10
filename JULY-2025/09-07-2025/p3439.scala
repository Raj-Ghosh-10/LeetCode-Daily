object Solution {
    def maxFreeTime(eventTime: Int, k: Int,
        startTime: Array[Int], endTime: Array[Int]): Int = {
        val array = (startTime :+ eventTime).zip(0 +: endTime).map(v => v._1 - v._2)
        val sum = array.take(k + 1).sum
        array.drop(k + 1).foldLeft((sum, sum, 0)) {
            case ((max, currentSum, i), value) =>
                val newSum = currentSum - array(i) + value
                (math.max(max, newSum), newSum, i + 1)
        }._1
    }
}