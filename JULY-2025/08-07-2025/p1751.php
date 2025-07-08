class Solution
{

    /**
     * @param Integer[][] $events
     * @param Integer $k
     * @return Integer
     */
    function maxValue($events, $k)
    {
        $h = [];
        $days = [0];
        foreach ($events as $event) {
            $h[$event[1]][] = [$event[0], $event[2]];
            $days[] = $event[0] - 1;
            $days[] = $event[1];
        }
        $days = array_unique($days);
        sort($days);
        $a = [];
        $a[0] = array_fill(0, $k + 1, 0);
        foreach ($days as $day) {
            $a[$day] = end($a);
            foreach ($h[$day] ?? [] as $e) {
                for ($j = 1; $j <= $k; $j++) {
                    $a[$day][$j] = max($a[$day][$j], $e[1] + $a[$e[0] - 1][$j - 1] ?? 0);
                }
            }
        }

        return max(end($a));
    }
}