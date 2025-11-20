class Solution {
    fun intersectionSizeTwo(intervals: Array<IntArray>): Int {
            intervals.sortBy{ it[0]}
            val set = mutableSetOf<Int>()
            val firstArr = intervals[intervals.size -1]
            set.add(firstArr[0])
            set.add(firstArr[0]+1)
            for(i in intervals.size-2 downTo 0 ){
                val currentArr = intervals[i]
                var left = currentArr[0]
                var right = currentArr[1]
                var count = 0
                for(s in set){
                    if(s >= left && s <= right) count++
                    if(count == 2) break
                }
                while(count < 2){
                    if(set.contains(left)){
                        left++
                        continue
                    }
                    set.add(left)
                    left++
                    count++
                }
            }
            return set.size
    }
}