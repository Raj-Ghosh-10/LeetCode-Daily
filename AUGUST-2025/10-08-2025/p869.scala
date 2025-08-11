object Solution {
    def reorderedPowerOf2(n: Int): Boolean = {
        n.toString.foldLeft(Set(List.empty[Char])) { case (acc,cur) => acc.flatMap( p => 
            (0 to p.size).map(i => p.take(i) ++ List(cur) ++ p.drop(i))
        )
        }.map(_.mkString).filterNot(_.startsWith("0")).map(_.toInt).find(n => n>0 && (n & n-1) == 0).isDefined
    }
}