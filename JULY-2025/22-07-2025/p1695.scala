object Solution {
    def maximumUniqueSubarray(nums: Array[Int]): Int = {

        nums.zipWithIndex.foldLeft((Map.empty[Int, Int]), 0, 0) {
                case ((acc, left, maxScore), (curr, i)) => 
                {
                    val newLeft = acc.get(curr).filter(_>=left).map(_+1).getOrElse(left)
                    (acc + (curr -> i), newLeft, maxScore max nums.slice(newLeft, i+1).sum) 
                }


        }._3
        
    }
}