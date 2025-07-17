object Solution {
  def maximumLength(nums: Array[Int], k: Int): Int = {
    (for {
      i <- nums.indices.iterator.take(nums.length - 1)
      j <- (i + 1).until(nums.length)
    }
    yield {
      ((nums(i) + nums(j)) % k, (i, j))
    })
      .toList.groupMap(_._1)(_._2).iterator
      .flatMap(_._2.sortBy(_.swap)
        .foldLeft(Map.empty[Int, Int].withDefaultValue(0)) {
          case (aMap, (l, r)) => aMap + (r -> (aMap(r) max (aMap(l) + 1)))
        }.values
      ).maxOption.getOrElse(0) + 1
  }
}