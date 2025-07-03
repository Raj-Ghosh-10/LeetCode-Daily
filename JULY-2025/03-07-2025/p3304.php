class Solution {

    /**
     * @param Integer $k
     * @return String
     */
    function kthCharacter($k) {
        if ($k == 1) {
            return 'a';
        }

        $m = strlen(decbin($k - 1));
        $half = 1 << ($m - 1);
        $prevChar = $this->kthCharacter($k - $half);
        
        return chr((ord($prevChar) - ord('a') + 1) % 26 + ord('a'));
    }
}