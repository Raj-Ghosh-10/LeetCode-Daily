class Solution {

    /**
     * @param Integer $n
     * @return Boolean
     */
    function isPowerOfTwo($n) {
        if ($n < 0) return false;
        $absN = abs($n);
        if ($absN <= 1) {
            if ($n == 0) return false;
            return true;
        }
        $n = $absN;

        while ($n > 1) {
            if ($n % 2 != 0) {
                return false;
            }
            $n /= 2;
        }
        return true;
    }
}