class Solution {

    /**
     * @param Integer[] $arr
     * @return Integer
     */
    function findLucky($arr) {
        $count=[];

        foreach($arr as $num)
        {
            if(isset($count[$num]))
            {
                $count[$num]++;
            }
            else{
                $count[$num]=1;
            }
        }
        $maxlucky=-1;
        foreach($count as $num=>$freq){
            if($num == $freq && $num > $maxlucky)
            {
                $maxlucky = $num;
            }
        }
        return $maxlucky;
    }
}