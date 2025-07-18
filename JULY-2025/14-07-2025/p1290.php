/**
 * Definition for a singly-linked list.
 * class ListNode {
 *     public $val = 0;
 *     public $next = null;
 *     function __construct($val = 0, $next = null) {
 *         $this->val = $val;
 *         $this->next = $next;
 *     }
 * }
 */
class Solution {

    /**
     * @param ListNode $head
     * @return Integer
     */
    function getDecimalValue($head) {
         $current = $head;
         $binString ="";
        while ($current !== null) {
           $binString.= $current->val ;
            $current = $current->next;
        }
        return bindec($binString);
    }
}