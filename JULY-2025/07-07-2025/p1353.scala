import scala.collection.immutable._
object Solution {
  def maxEvents(events: Array[Array[Int]]): Int = {
    val list = events.sortInPlace()(Ordering.by(x => x(1))).toList

    @scala.annotation.tailrec
    def getCountOfDays(list: List[Array[Int]], ans: Int = 0, set: TreeSet[Int] = TreeSet.from(1 to 100005)): Int = {
      list match {
        case Nil => ans
        case head :: tail =>
          val minDay = set.minAfter(head(0))
          minDay match {
            case Some(x) =>
              if (head(1) >= x) getCountOfDays(tail, ans + 1, set - x)
              else getCountOfDays(tail, ans, set)
            case None => 0
          }
      }
    }

    getCountOfDays(list)
  }
}