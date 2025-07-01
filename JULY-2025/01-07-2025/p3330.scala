object Solution {
    def possibleStringCount(word: String): Int = {
        word.toCharArray.foldLeft((0, word.head)) {
            case ((count, prev), value) =>
                if (prev == value) (count + 1, value) else (count, value)
        }._1
    }
}