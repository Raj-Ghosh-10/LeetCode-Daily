class Solution {

    /**
     * @param Integer $n
     * @param Integer $firstPlayer
     * @param Integer $secondPlayer
     * @return Integer[]
     */
    function earliestAndLatest($n, $firstPlayer, $secondPlayer) {
        // Determine the lower and upper player positions
        $lower = min($firstPlayer, $secondPlayer);
        $upper = max($firstPlayer, $secondPlayer);
        
        // If they are mirrored positions — they will meet in the first round
        if ($lower + $upper == $n + 1) {
            return [1, 1];
        }
        
        // Handle base cases for 3 or 4 players
        if ($n == 3 || $n == 4) {
            return [2, 2];
        }
        
        // Mirror for symmetry in positions
        if ($lower - 1 > $n - $upper) {
            $temp = $n + 1 - $lower;
            $lower = $n + 1 - $upper;
            $upper = $temp;
        }
        
        // Calculate the number of players in the next round
        $nextRoundPlayers = intval(($n + 1) / 2);
        $minRound = $n;
        $maxRound = 1;
        
        if ($upper * 2 <= $n + 1) {
            // Both players are in the left half of the current round
            $playersBeforeLower = $lower - 1;
            $gapBetweenPlayers = $upper - $lower - 1;
            for ($i = 0; $i <= $playersBeforeLower; $i++) {
                for ($j = 0; $j <= $gapBetweenPlayers; $j++) {
                    // New position for the lower player
                    $newLower = $i + 1;
                    // New position for the upper player
                    $newUpper = $i + $j + 2;
                    $result = $this->earliestAndLatest($nextRoundPlayers, $newLower, $newUpper);
                    $minRound = min($minRound, 1 + $result[0]);
                    $maxRound = max($maxRound, 1 + $result[1]);
                }
            }
        } else {
            // Players are in opposite halves of the current round
            $mirroredPosition = $n + 1 - $upper;
            $playersBeforeLower = $lower - 1;
            $gapBetweenLowerAndMirrored = $mirroredPosition - $lower - 1;
            $gapBetweenUpperAndMirrored = $upper - $mirroredPosition - 1;
            for ($i = 0; $i <= $playersBeforeLower; $i++) {
                for ($j = 0; $j <= $gapBetweenLowerAndMirrored; $j++) {
                    // New position for the lower player
                    $position1 = $i + 1;
                    // New position for the upper player
                    $position2 = $i + $j + 1 + intval(($gapBetweenUpperAndMirrored + 1) / 2) + 1;
                    $result = $this->earliestAndLatest($nextRoundPlayers, $position1, $position2);
                    $minRound = min($minRound, 1 + $result[0]);
                    $maxRound = max($maxRound, 1 + $result[1]);
                }
            }
        }
        
        return [$minRound, $maxRound];
    }
}