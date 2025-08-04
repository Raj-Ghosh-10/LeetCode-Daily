object Solution {
  def totalFruit(fruits: Array[Int]): Int = {
    var result = 0
    var left = 0
    var right = 0
    val n = fruits.length
    var picking = collection.mutable.Set.empty[Int]
    var prevFruit = fruits(0)
    var sameFruitStreak = 0
    while (right < n) {
      val fruit = fruits(right)
      if (!picking.contains(fruit)) {
        if (picking.size == 2) {
          val otherFruit = fruits(right - 1)
          picking = picking.filter(_ == otherFruit)
          left = right - sameFruitStreak
        }
        picking.add(fruit)
      }
      if (fruit == prevFruit) sameFruitStreak += 1
      else {
        prevFruit = fruit
        sameFruitStreak = 1
      }
      
      right += 1
      result = result max (right - left)
    }
    result
  }
}