class Solution {

    /**
     * @param Integer[] $nums
     * @param Integer $k
     * @return Integer[]
     */
    function maxSubsequence($nums, $k) {
        if( $k === count( $nums ) ) return $nums;
        
        $copy = $nums; // Make a copy not to mod original arr
        rsort( $copy ); // Reverse sort for get the k largest
        
        // Build the frequency mamp
        $freq = array_count_values( array_splice( $copy, 0, $k ) );
        
        $res = [];
        foreach( $nums as $num ) {
            if( isset( $freq[$num] ) && $freq[$num] > 0 ) {
                $res[] = $num;
                $freq[$num]--;
                if (count($res) === $k) break;
            }
        }
        
        return $res;
    }
}