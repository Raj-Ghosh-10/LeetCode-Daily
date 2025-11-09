class Solution {
    /**
     * @param Integer $num1
     * @param Integer $num2
     * @return Integer
     */
    function countOperations($num1, $num2) {
        $counter = 0;
        while($num1 && $num2){
            ($num1>=$num2) ? $num1 = $num1 - $num2 : $num2 = $num2-$num1;
            $counter++;    
        }
    return $counter;
    }
}