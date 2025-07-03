object Solution {
  def kthCharacter(k: Int): Char = {
    var asc = List(0)
    while (asc.length < k) {
      val current = asc
      current.foreach { v =>
        if (asc.length < k)
          asc = asc :+ ((v + 1) % 26)
      }
    }
    (asc(k - 1) + 'a'.toInt).toChar
  }
}