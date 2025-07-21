class Solution {

    /**
     * @param String $s
     * @return String
     */
    function makeFancyString($s) {
        
        $isNotConsecutive = true;
        $newString = $s[0];
        
        $loopLimit = strlen($s) + 1;

        // loop and check every word with next letter if they equal, 
        // and also check if previous letter also equal
        // if all 3 of them equal then skip the letter
        // otherwise concat to our newString which is our result

        for ($i = 0; $i < $loopLimit; $i++) {

            if ($s[$i] == $s[$i+1]) {
                
                if($isNotConsecutive) {
                    $newString .= $s[$i+1];
                    $isNotConsecutive = false;
                }
            } else {
                $newString .= $s[$i+1];
                $isNotConsecutive = true;
            }
        }
        return $newString;
    }
}