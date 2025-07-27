class Solution {

    /**
     * @param Integer[] $nums
     * @return Integer
     */
    function getLeft($nums, $i){
        if(isset($nums[$i - 1])){
            if($nums[$i] == $nums[$i - 1])
                return $this->getLeft($nums, --$i);
            else
                return $i - 1;
        }
        else{
            return $i;
        }
    }

    function countHillValley($nums) {
        $countNums = count($nums) - 1;
        $valleys = 0;
        $hills = 0;
        for($i = 1; $i < $countNums; $i++){
                $left = $this->getLeft($nums, $i);

                $valleys += $nums[$i] < $nums[$left] && $nums[$i] < $nums[$i + 1] ? 1 : 0;
                $hills += $nums[$i] > $nums[$left] && $nums[$i] > $nums[$i + 1] ? 1 : 0;
        }

        return $valleys + $hills;
    }
}