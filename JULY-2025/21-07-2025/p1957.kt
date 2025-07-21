class Solution {

    private companion object {
        const val PLACEHOLDER = '\u0000'
    }

    fun makeFancyString(input: String): String {
        val result = StringBuilder()
        var previous: Char = PLACEHOLDER
        var countConsecutiveRepetitions = 0

        for (current in input) {
            if (current != previous) {
                result.append(current)
                countConsecutiveRepetitions = 1
            } else if (countConsecutiveRepetitions < 2) {
                result.append(current)
                ++countConsecutiveRepetitions
            }
            previous = current
        }
        return result.toString()
    }
}