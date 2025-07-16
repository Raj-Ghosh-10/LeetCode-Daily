class Solution {

    /**
     * @param Integer[] $nums
     * @return Integer
     */
    function maximumLength($nums) {
      $even = 0;
    $odd = 0;
    $alt = 0;
    $p = $nums[0] & 1;

    foreach ($nums as $num) {
        $bit = $num & 1;
        if ($bit == $p) {
            $alt++;
            $p = ($p == 1) ? 0 : 1;
        }
        if ($bit == 1) {
            $odd++;
        } else {
            $even++;
        }
    }

    return max($alt, max($even, $odd));  
    }
}