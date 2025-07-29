object Solution {
  import scala.util.chaining._
  import collection.immutable.BitSet
  def smallestSubarrays(nums: Array[Int]): Array[Int] =
    nums.toList.zipWithIndex.reverseIterator.scanLeft((Map.empty[Int,Int],0)){case ((aMap,acc),(num,i))=>
      (aMap ++ BitSet.fromBitMask(Array(num)).map(_ -> i), acc | num)
    }.drop(1).toList.reverse.pipe(sfx => (nums.indices.toArray zip sfx).map{case (i,(bMap,mx)) =>
      if(mx == 0) 1 else BitSet.fromBitMask(Array(mx)).iterator.map(bMap).max - i + 1
    })
}