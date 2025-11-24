class Solution {

    /**
     * @param Integer[] $nums
     * @return Boolean[]
     */
    function prefixesDivBy5($nums) {
        $ans = [];
        $mod = 0;

        foreach ($nums as $bit) {
            $mod = ($mod * 2 + $bit) % 5;
            $ans[] = ($mod == 0);
        }

        return $ans;
    }
}