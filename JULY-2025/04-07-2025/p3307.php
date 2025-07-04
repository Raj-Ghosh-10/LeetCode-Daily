class Solution {

    /**
     * @param Integer $k
     * @param Integer[] $operations
     * @return String
     */
        function kthCharacter(int $k, array $operations): string {
            $countOps = 0;
            $val = $k;
            while ($val > 1) {
                $jumps = (int)ceil(log($val, 2));
                $val -= 1 << ($jumps - 1);
                $countOps += $operations[$jumps - 1];
            }
            $ch = chr(ord('a') + ($countOps % 26));
            return $ch;
        }
}