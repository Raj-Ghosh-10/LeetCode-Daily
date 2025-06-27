class Solution {

    /**
     * @param String $s
     * @param Integer $k
     * @return String
     */
    function longestSubsequenceRepeatedK($s, $k) {
         $ans = "";
        $queue = new SplQueue();
        $queue->enqueue("");

        while (!$queue->isEmpty()) {
            $curr = $queue->dequeue();
            for ($ch = ord('a'); $ch <= ord('z'); $ch++) {
                $next = $curr . chr($ch);
                if ($this->solve($next, $s, $k)) {
                    $ans = $next;
                    $queue->enqueue($next);
                }
            }
        }

        return $ans;
    }

     public function solve($sub, $s, $k) {
        $i = 0;
        $count = 0;
        $subLen = strlen($sub);

        for ($j = 0; $j < strlen($s); $j++) {
            if ($s[$j] === $sub[$i]) {
                $i++;
                if ($i === $subLen) {
                    $i = 0;
                    $count++;
                    if ($count === $k) {
                        return true;
                    }
                }
            }
        }
        return false;
    }
}