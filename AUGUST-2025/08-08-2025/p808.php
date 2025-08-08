class Solution {
    public $memo;

    function soupServings($n) {
        if ($n >= 4800) return 1.0;
        $this->memo = array_fill(0, $n + 1, array_fill(0, $n + 1, null));
        return $this->go($n, $n);
    }

    function go($a, $b) {
        if ($a <= 0 && $b <= 0) return 0.5;
        if ($a <= 0) return 1.0;
        if ($b <= 0) return 0.0;
        if ($this->memo[$a][$b] !== null) return $this->memo[$a][$b];
        return $this->memo[$a][$b] = 0.25 * (
            $this->go($a - 100, $b) +
            $this->go($a - 75, $b - 25) +
            $this->go($a - 50, $b - 50) +
            $this->go($a - 25, $b - 75)
        );
    }
}

$solution = new Solution();
$n = 50;
echo $solution->soupServings($n);