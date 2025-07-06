<?php

class FindSumPairs {
    private $nums1;
    private $nums2;
    private $count2;

    /**
     * @param Integer[] $nums1
     * @param Integer[] $nums2
     */
    function __construct($nums1, $nums2) {
        $this->nums1 = $nums1;
        $this->nums2 = $nums2;
        $this->count2 = array_count_values($nums2);
    }

    /**
     * @param Integer $index
     * @param Integer $val
     * @return NULL
     */
    function add($index, $val) {
        $oldVal = $this->nums2[$index];
        $this->count2[$oldVal]--;
        if ($this->count2[$oldVal] == 0) {
            unset($this->count2[$oldVal]);
        }
        $this->nums2[$index] += $val;
        $newVal = $this->nums2[$index];
        if (!isset($this->count2[$newVal])) {
            $this->count2[$newVal] = 0;
        }
        $this->count2[$newVal]++;
    }

    /**
     * @param Integer $tot
     * @return Integer
     */
    function count($tot) {
        $result = 0;
        foreach ($this->nums1 as $num) {
            $complement = $tot - $num;
            if (isset($this->count2[$complement])) {
                $result += $this->count2[$complement];
            }
        }
        return $result;
    }
}

// Example usage:
// $obj = new FindSumPairs([1,2,3], [3,4,5]);
// $obj->add(0, 2);
// $count = $obj->count(7);
// echo $count; // Output: 1

?>