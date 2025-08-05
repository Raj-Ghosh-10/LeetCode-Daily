object Solution {
    def numOfUnplacedFruits(fruits: Array[Int], baskets: Array[Int]): Int = {
        fruits.foldLeft(baskets.zipWithIndex) {
            case (acc, value) =>
                acc.find {
                    case (v, _) => v >= value
                } match {
                    case None => acc
                    case Some((v, idx)) =>
                        acc(idx) = (0, idx)
                        acc
                }
        }.count {
            case (v, _) => v > 0
        }
    }
}