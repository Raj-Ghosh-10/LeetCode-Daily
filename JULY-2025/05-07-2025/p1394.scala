object Solution {
    def findLucky(arr: Array[Int]): Int = {
        arr.groupBy(identity).toList.sortBy(_._1).reverse.find {
            case (v1, v2) => v1 == v2.length
        }.map(_._1).getOrElse(-1)
    }
}