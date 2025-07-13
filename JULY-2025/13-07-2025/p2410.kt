class Solution {
    fun matchPlayersAndTrainers(players: IntArray, trainers: IntArray): Int {
        val cou_trainers = trainers.size
        fun countSort(arr: IntArray, offset: Int, output: IntArray) {
            val count = IntArray(256)

            for (i in 0 until arr.size) 
            count[(arr[i] ushr offset) and 0xFF]++

            for (i in 1 until 256)
                count[i] += count[i - 1]
    // по возрастанию
            for (i in arr.size - 1 downTo 0) {
                val a = arr[i]
                output[--count[(a ushr offset) and 0xFF]] = a
            }
        }
        fun radixSort(arr: IntArray): IntArray {
            val output = IntArray(arr.size)
            countSort(arr, 0, output)
            countSort(output, 8, arr)
            countSort(arr, 16, output)
            countSort(output, 24, arr)
            return arr
        }

        val trainers_s = radixSort(trainers) 
        val players_s = radixSort(players) 
        var rez = 0
        var pos_trainers=0
        for (pl in players_s) {
            while (pos_trainers<cou_trainers)
                if (pl<=trainers_s[pos_trainers++]) {
                    rez++
                    break
                }
            if (pos_trainers==cou_trainers) break
        }
        return rez
    }
}