class Solution {

    /**
     * @param Integer $n
     * @return Boolean
     */
    function isPowerOfThree($n) {
        if($n < 1) {
            return false;
        }

        return 1162261467 % $n === 0;
    }
}