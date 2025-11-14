object Solution {
  import scala.util.chaining._
  def rangeAddQueries(n: Int, queries: Array[Array[Int]]): Array[Array[Int]] = {
    val pfx = Array.fill(n,n)(0)
    queries.foreach{q =>
      Iterator.range(q(0),q(2)+1).foreach{r =>
        pfx(r)(q(1)) += 1
        if(q(3)+1<n) pfx(r)(q(3)+1) -= 1
      }
    }
    Iterator.range(0,n).foreach { r =>
      Iterator.range(0,n).foldLeft(0) { case (acc, c) =>
        (acc+pfx(r)(c)).tap(pfx(r)(c) = _)
      }
    }
    pfx
  }
}