class Solution {

    /**
     * @param String $num
     * @return String
     */
    function largestGoodInteger($num) {
        $codes = ['999', '888', '777', '666', '555', '444', '333', '222', '111', '000'];

foreach ($codes as $code) {
    if (strpos($num, $code) !== false) {
        return  $code;
    }
        
    }
    return ''; 
    }
}