class Solution {

    /**
     * @param Integer $eventTime
     * @param Integer $k
     * @param Integer[] $startTime
     * @param Integer[] $endTime
     * @return Integer
     */
    function maxFreeTime($eventTime, $k, $startTime, $endTime) {
        $count = count($startTime);
    $max = 0;
    $prefixSum = array_fill(0, $count + 1, 0);

    for ($i = 0; $i < $count; $i++) {
        $prefixSum[$i + 1] = $prefixSum[$i] + ($endTime[$i] - $startTime[$i]);
    }

    for ($i = $k - 1; $i < $count; $i++) {
        $occupied = $prefixSum[$i + 1] - $prefixSum[$i - $k + 1];
        $windowEnd = ($i == $count - 1) ? $eventTime : $startTime[$i + 1];
        $windowStart = ($i == $k - 1) ? 0 : $endTime[$i - $k];
        $max = max($max, $windowEnd - $windowStart - $occupied);
    }

    return $max;
    }
}