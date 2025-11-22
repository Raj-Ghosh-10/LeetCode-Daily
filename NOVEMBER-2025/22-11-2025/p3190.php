class Solution {

    /**
     * @param Integer[] $nums
     * @return Integer
     */
    function minimumOperations($nums) {
        $ans = 0;
        foreach ($nums as $x) if ($x % 3 != 0) $ans++;
        return $ans;
    }
}