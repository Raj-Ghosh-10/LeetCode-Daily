class Solution {
    fun generate(numRows: Int): List<List<Int>> {
        val rez  = List(numRows) {MutableList(it+1){ 1 }}
        for (i in 2 until numRows) {
            val Prev = rez[i-1]
            for (j in 1 until i) 
                rez[i][j] = Prev[j-1] + Prev[j]
        }
        return rez
    }
}