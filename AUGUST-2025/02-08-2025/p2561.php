class Solution {
    /**
     * @param Integer[] $basket1 * @param Integer[] $basket2
     * @return Integer
     */
    function minCost($basket1, $basket2) {
        $map = []; $minFruit = PHP_INT_MAX;

        // Count fruits from both baskets
        foreach ($basket1 as $fruit) {
            if (!isset($map[$fruit])) $map[$fruit] = 0;
            $map[$fruit]++;
            $minFruit = min($minFruit, $fruit); } foreach ($basket2 as $fruit) { if (!isset($map[$fruit])) $map[$fruit] = 0; $map[$fruit]--; $minFruit = min($minFruit, $fruit);
        }

        // Make two arrays for extra fruits
        $extra1 = []; $extra2 = [];

        foreach ($map as $fruit => $count) { if ($count % 2 != 0) return -1; // not possible

            $times = abs($count) / 2;
            if ($count > 0) { for ($i = 0; $i < $times; $i++) { $extra1[] = $fruit; } } else if ($count < 0) {
                for ($i = 0; $i < $times; $i++) {
                    $extra2[] = $fruit;
                }
            }
        }

        sort($extra1); // ascending rsort($extra2);    // descending

        $cost = 0; $n = count($extra1); for ($i = 0; $i < $n; $i++) { $a = $extra1[$i];
            $b = $extra2[$i]; $cost += min(min($a, $b), 2 * $minFruit); } return $cost;
    }
}//LAST CASE WRONG