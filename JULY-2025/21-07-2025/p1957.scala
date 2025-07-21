object Solution {
    def makeFancyString(s: String): String = {
        if (s.length < 3) s
        else {
            val array = new Array[Char](s.length);
            array(0) = s(0)
            array(1) = s(1)
            val i = s.drop(2).foldLeft(2) {
                case (i, c) =>
                    if (array(i - 1) == c && array(i - 2) == c) i
                    else {
                        array(i) = c
                        i + 1
                    }
            }
            array.take(i).mkString
        }
    }
}