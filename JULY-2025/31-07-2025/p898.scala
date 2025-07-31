object Solution {
  import scala.util.chaining._
  def subarrayBitwiseORs(arr: Array[Int]): Int = 
    arr.iterator.scanLeft(Set.empty[Int]){case (aSet,a) =>
      aSet.map(_ | a) + a
    }.drop(1).reduceLeft(_ ++ _).size
}