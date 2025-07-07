class Solution {

    /**
     * @param Integer[][] $events
     * @return Integer
     */
    function maxEvents($events) {
        // Sort events by start day
        usort($events, function($a, $b) {
            return $a[0] - $b[0];
        });

        $day = 0;
        $i = 0;
        $attended = 0;
        $n = count($events);
        $heap = new SplMinHeap();

        // Get the maximum end day among all events
        $lastDay = 0;
        foreach ($events as $event) {
            $lastDay = max($lastDay, $event[1]);
        }

        // Iterate from day 1 to last possible end day
        for ($day = 1; $day <= $lastDay; $day++) {
            // Push all events starting today into the heap
            while ($i < $n && $events[$i][0] == $day) {
                $heap->insert($events[$i][1]);
                $i++;
            }

            // Remove expired events from the heap
            while (!$heap->isEmpty() && $heap->top() < $day) {
                $heap->extract();
            }

            // Attend the event that ends earliest
            if (!$heap->isEmpty()) {
                $heap->extract();
                $attended++;
            }
        }

        return $attended;
    }

}