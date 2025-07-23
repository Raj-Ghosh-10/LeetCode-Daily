class Solution {

    /**
     * @param String $s
     * @param Integer $x
     * @param Integer $y
     * @return Integer
     */
    function maximumGain($s, $x, $y) {
        $aCount = 0;
    $bCount = 0;
    $lesser = min($x, $y);
    $res = 0;

    $len = strlen($s);
    for ($i = 0; $i < $len; $i++) {
        $c = $s[$i];
        if ($c > 'b') {
            $res += min($aCount, $bCount) * $lesser;
            $aCount = 0;
            $bCount = 0;
        } else if ($c == 'a') {
            if ($x < $y && $bCount > 0) {
                $bCount--;
                $res += $y;
            } else {
                $aCount++;
            }
        } else { // $c == 'b'
            if ($x > $y && $aCount > 0) {
                $aCount--;
                $res += $x;
            } else {
                $bCount++;
            }
        }
    }

    $res += min($aCount, $bCount) * $lesser;
    return $res;
    }
}