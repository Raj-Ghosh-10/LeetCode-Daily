object Solution {
    def generate(numRows: Int): List[List[Int]] = {
         (1 to numRows).foldLeft(List[List[Int]]())((acc, cur) =>
      cur match {
        case 1 => acc :+ List(1)
        case 2 => acc :+ List(1, 1)
        case n =>
          val tmp: List[Int] = acc(cur - 2)
          acc :+ ((1 to n - 2).foldLeft(List[Int](1))((subAcc, subCur) =>
            subAcc :+ (tmp(subCur - 1) + tmp(subCur))
          ) :+ 1)
      }
    )
    }
}