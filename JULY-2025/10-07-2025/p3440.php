class Solution {

    /**
     * @param Integer $eventTime
     * @param Integer[] $startTime
     * @param Integer[] $endTime
     * @return Integer
     */
    function maxFreeTime($eventTime, $startTime, $endTime) {
        $n = count($startTime);
        // Initial maximum free time before first meeting and after last meeting
        $maxBeforeFirst = $startTime[0];
        $maxAfterLast = $eventTime - $endTime[$n - 1];
        
        // Calculate initial maximum considering adjacent meetings
        $maxFree = max(
            $maxBeforeFirst + ($n > 1 ? $startTime[1] - $endTime[0] : 0),
            $maxAfterLast + ($n > 1 ? $startTime[$n - 1] - $endTime[$n - 2] : 0)
        );
        
        // Initialize variables to track maximum gaps before and after each meeting
        $maxGapBefore = $maxBeforeFirst;
        $maxGapAfter = $maxAfterLast;
        for ($i = 1; $i < $n; $i++) {
            $k = $n - 1 - $i; // Mirror index for the end of the array
            
            // Calculate potential free time by moving current meeting
            // For meetings in the first half of the array
            $nextStart = ($i < $n - 1) ? $startTime[$i + 1] : $eventTime;
            $currentDuration = $endTime[$i] - $startTime[$i];
            $potentialFree = $nextStart - $endTime[$i - 1] - ($currentDuration <= $maxGapBefore ? 0 : $currentDuration);
            $maxFree = max($maxFree, $potentialFree);
            
            // For meetings in the second half of the array
            $prevEnd = ($k > 0) ? $endTime[$k - 1] : 0;
            $currentDurationK = $endTime[$k] - $startTime[$k];
            $potentialFreeK = $startTime[$k + 1] - $prevEnd - ($currentDurationK <= $maxGapAfter ? 0 : $currentDurationK);
            $maxFree = max($maxFree, $potentialFreeK);
            
            // Update maximum gaps
            $maxGapBefore = max($maxGapBefore, $startTime[$i] - $endTime[$i - 1]);
            $maxGapAfter = max($maxGapAfter, ($k < $n - 1 ? $startTime[$k + 1] - $endTime[$k] : 0));
        }
        
        return $maxFree;
    }
}