class Solution {

    /**
     * @param Integer[] $fruits
     * @return Integer
     */
    function totalFruit($fruits) {
        $n = count($fruits);
        if ($n < 3) {
            return $n;
        }

        $basket = [];
        $l = 0; 
        $r = 0;
        $count = 0;
        $res = 0;

        while ($r < $n) {
            $basket[$fruits[$r]] = ($basket[$fruits[$r]] ?? 0) + 1;
            //set left pointer only for the first fruit of second type
            if (count($basket) === 2 && $basket[$fruits[$r]] === 1) {
                $l = $r;
            } elseif (count($basket) > 2) {
                unset($basket);
                $res = max($res, $count);
                $count = 0;
                $r = $l;
                continue;
            }
            $count++;
            $r++;
        }

        return max($res, $count);
    }
}