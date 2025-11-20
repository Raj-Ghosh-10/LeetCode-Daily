class Solution {

    /**
     * @param Integer[][] $intervals
     * @return Integer
     */
    function intersectionSizeTwo($intervals) {

        // Sort intervals by their end value
        usort($intervals, function($a, $b) {
            return $a[1] <=> $b[1];
        });

        $prev1 = $intervals[0][1] - 1;
        $prev2 = $intervals[0][1];
        $count = 2;

        for ($i = 1; $i < count($intervals); $i++) {
            $start = $intervals[$i][0];
            $end   = $intervals[$i][1];

            // Case 1: prev2 < start → need 2 new points
            if ($prev2 < $start) {
                $prev1 = $end - 1;
                $prev2 = $end;
                $count += 2;
            }
            // Case 2: prev2 overlaps but prev1 doesn't → need 1 new point
            else if ($prev1 < $start) {
                if ($end == $prev2) {
                    $prev1 = $end - 1;
                } else {
                    $prev1 = $end;
                }

                // Ensure prev1 ≤ prev2
                if ($prev1 > $prev2) {
                    $temp = $prev1;
                    $prev1 = $prev2;
                    $prev2 = $temp;
                }

                $count += 1;
            }
        }

        return $count;
    }
}