class Solution {

    /**
     * @param Integer $n
     * @param Integer[][] $queries
     * @return Integer[]
     */
    function productQueries($n, $queries) {
        $powers = [];
        $k = 1;

        // 1111 = [1, 2, 4, 8]
        // 101 = [1, 4]
        while ($n){
            if ($n % 2){
                $powers[] = $k;
            }
            $k = $k << 1;
            $n = $n >> 1;
        }

        $ans = [];
        for ($i = 0; $i < count($queries); $i++){
            $k = 1;
            for ($j = $queries[$i][0]; $j <= $queries[$i][1]; $j++){
                $k *= $powers[$j];
                $k = $k % (10 ** 9 + 7);
            }

            $ans[] = $k;
        }

        return $ans;
    }
}