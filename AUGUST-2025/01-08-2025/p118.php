class Solution {

    /**
     * @param Integer $numRows
     * @return Integer[][]
     */
    function generate($numRows) {
        $tr = [];
        for ($i = 1; $i <= $numRows; $i++) {
            $perem = [];
            for ($j = 0; $j < $i; $j++) {
                if ($j == 0 || $j == $i - 1) $perem[] = 1;
                else {
                    $perem[] = $tr[$i - 2][$j] + $tr[$i - 2][$j - 1];
                }
            }
            $tr[] = $perem;
        }
        return $tr;
    }
}