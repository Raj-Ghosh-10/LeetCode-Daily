class Solution {
    fun kthCharacter(k: Long, operations: IntArray): Char {
        var length = 1.0

        for (i in 0 until operations.size) {
            length *= 2
        }

        var j = operations.size - 1
        var tk = k - 1.0
        var step = 0

        while(j >= 0) {
            val half = length / 2
            val operation = operations[j]

            if (tk >= half) {
                tk = tk - half
                if (operation == 1) {
                    step++
                }
            }
            length /= 2
            j--
        }

        return 'a' + step % 26
    }
}