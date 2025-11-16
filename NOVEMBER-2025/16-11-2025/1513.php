class Solution {

    /**
     * @param String $s
     * @return Integer
     */
    function numSub($s) {
        $mod = 1000000007;
        $count = 0;
        $res = 0;

        for ($i = 0; $i < strlen($s); $i++) {
            if ($s[$i] == '1') {
                $count++;
                $res = ($res + $count) % $mod;
            } else {
                $count = 0;
            }
        }

        return $res;
    }
}