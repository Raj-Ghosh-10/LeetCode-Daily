class Solution {

    /**
     * @param Integer $n * @param Integer[][] $conflictingPairs
     * @return Integer
     */
    function maxSubarrays($n, $conflictingPairs) {
        $right = []; foreach ($conflictingPairs as [$a, $b]) {
            $maxV = max($a, $b); $minV = min($a, $b);
            $right[$maxV][] = $minV; } $result = 0;
        $left = [0, 0]; $bonus = [];

        for ($r = 1; $r <= $n; $r++) {
            if (isset($right[$r])) {
                foreach ($right[$r] as $l) { if ($l > $left[0]) { $left[1] = $left[0]; $left[0] = $l; } else if ($l > $left[1]) { $left[1] = $l; } } } $result += $r - $left[0];
            if (!isset($bonus[$left[0]])) {
                $bonus[$left[0]] = 0;
            }
            $bonus[$left[0]] += $left[0] - $left[1];
        }

        return $result + (empty($bonus) ? 0 : max($bonus));
    }
}