class Solution {

    /**
     * @param Integer $n
     * @return Boolean
     */
    function isPowerOfFour($n) {
         if ($n <= 0) return false; 
    if (($n & ($n - 1)) !== 0) return false; 
    return ($n & 0x55555555) === $n;

    }
}