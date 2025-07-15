class Solution {

    /**
     * @param String $word
     * @return Boolean
     */
    function isValid($word) {
        $vowels = "aeiouAEIOU";
        $containsCons = false;
        if(strlen($word) < 3) return false;
        for($i = 0; $i<strlen($word); $i++){
            $c = ord($word[$i]);
            if(($c >= 65 && $c <= 90) || ($c >= 97 && $c <= 122)){
               
                if(str_contains($vowels, chr($c))){
                    $vowels .= '+';
                }else{
                    $containsCons = true;
                }
            }else if($c >= 48 && $c <= 57){
                 continue;
            }else{
                return false;
            }
        }
       
        return (str_contains($vowels, '+') && $containsCons);
    }
}