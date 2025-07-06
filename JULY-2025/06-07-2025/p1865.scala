class FindSumPairs(_nums1: Array[Int], _nums2: Array[Int]) {
  import scala.collection.mutable

  private val nums2 = new mutable.HashMap[Int, Int](10_000, mutable.HashMap.defaultLoadFactor)

  {
    _nums2.foreach(n => patch(n, 1))
  }

  private def patch(num: Int, count: Int): Unit =
    nums2.updateWith(num) {
      case Some(prev) => Some(prev + count)
      case None       => if (count < 0) None else Some(count)
    }

  def add(index: Int, `val`: Int): Unit = {
    val prevNum = _nums2(index)
    val newNum = prevNum + `val`
    
    _nums2(index) = newNum

    patch(prevNum, -1)
    patch(newNum, 1)
  }

  def count(tot: Int): Int =
    _nums1.foldLeft(0){ case (acc, n) =>
      acc + nums2.getOrElse(tot - n, 0)
    }

}