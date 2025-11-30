class Solution {

    /**
     * @param Integer[] $nums
     * @param Integer $p
     * @return Integer
     */
    function minSubarray($nums, $p) {
        $total = array_sum($nums);
        $need = $total % $p;
        if ($need === 0) return 0;

        $map = [0 => -1];
        $prefix = 0;
        $res = count($nums);

        foreach ($nums as $i => $x) {
            $prefix = ($prefix + $x) % $p;
            $target = ($prefix - $need + $p) % $p;
            if (isset($map[$target])) {
                $res = min($res, $i - $map[$target]);
            }
            $map[$prefix] = $i;
        }

        return $res === count($nums) ? -1 : $res;
    }
}