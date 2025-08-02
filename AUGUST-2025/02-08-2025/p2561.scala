object Solution {
  def minCost(basket1: Array[Int], basket2: Array[Int]): Long = {
    import scala.collection.mutable
    val count = mutable.TreeMap[Long, Long]() 
    basket1.foreach(a => count.update(a.toLong, count.getOrElse(a.toLong, 0L) + 1L))
    basket2.foreach(a => count.update(a.toLong, count.getOrElse(a.toLong, 0L) - 1L))
    val small = count.firstKey
    if (count.values.exists(_ % 2 != 0)) return -1
    val swaps = count.flatMap { case (a, v) =>
      Seq.fill((math.abs(v) / 2).toInt)(a)
    }.toList
    swaps.view.take(swaps.size / 2).map(swap => math.min(swap, small * 2)).sum
  }
}