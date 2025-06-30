class Solution {

    /**
     * @param Integer[] $nums
     * @return Integer
     */
function findLHS($nums) {
    $freq = array_count_values($nums);
    

    $maxLen = 0;
    foreach ($freq as $num => $count) {
        if (isset($freq[$num + 1])) {
            $maxLen = max($maxLen, $count + $freq[$num + 1]);
        }
    }

    return $maxLen;
}

}