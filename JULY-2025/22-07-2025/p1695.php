class Solution {
    public function maximumUniqueSubarray($nums) {
        $S = [];
        $score = 0;
        $maxScore = 0;
        $l = 0;

        for ($r = 0; $r < count($nums); $r++) {
            while (isset($S[$nums[$r]])) {
                unset($S[$nums[$l]]);
                $score -= $nums[$l];
                $l++;
            }
            $S[$nums[$r]] = true;
            $score += $nums[$r];
            $maxScore = max($maxScore, $score);
        }

        return $maxScore;
    }
}