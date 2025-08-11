class Solution
{
    private $map = [
        1 => true,
        2 => true,
        4 => true,
        8 => true,
        61 => true,
        32 => true,
        64 => true,
        821 => true,
        652 => true,
        521 => true,
        4210 => true,
        8420 => true,
        9640 => true,
        9821 => true,
        86431 => true,
        87632 => true,
        66553 => true,
        732110 => true,
        644221 => true,
        885422 => true,
        8765410 => true,
        9752210 => true,
        9444310 => true,
        8888630 => true,
        77766211 => true,
        55443332 => true,
        88766410 => true,
        877432211 => true,
        866554432 => true,
        987653210 => true,
    ];


    /**
     * @param Integer $n
     * @return Boolean
     */
    function reorderedPowerOf2($n)
    {
        return isset($this->map[$this->conv($n)]);

    }

    function conv($n)
    {
        $r = [];
        while ($n) {
            $r[] = $n % 10;
            $n = intdiv($n, 10);
        }
        rsort($r);

        return join($r);
    }
}