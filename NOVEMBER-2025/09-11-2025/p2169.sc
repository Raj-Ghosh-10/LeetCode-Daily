object Solution {
    
   def countOperations(num1: Int, num2: Int): Int = num1 * num2 == 0 match {
    case true => 0
    case _ => num1/num2 + countOperations(num2, num1 % num2)
  }
}