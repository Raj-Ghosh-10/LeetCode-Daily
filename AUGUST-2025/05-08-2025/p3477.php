class Solution {

    /**
     * @param Integer[] $fruits
     * @param Integer[] $baskets
     * @return Integer
     */
    function numOfUnplacedFruits($fruits, $baskets) {
        $unplaced = 0;
        $placed = false;
        $count = count($fruits);
        for ($i = 0; $i < $count; ++$i) { 
            $placed = false;
            for ($j = 0; $j < $count; ++$j) {
                if ($baskets[$j] >= $fruits[$i]) {
                    $baskets[$j] = -1;  
                    $placed = true;
                    break;
                }
            }

            if (!$placed) {
                $unplaced++;  
            }
        }

        return $unplaced;
        
    }
}