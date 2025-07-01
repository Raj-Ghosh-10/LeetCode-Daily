class Solution {
    function possibleStringCount($word) {
        $count = strlen(preg_replace('/(.)\1+/', '$1', $word,));
        $count_word = strlen($word);
        return $count_word -$count + 1;
    }
}