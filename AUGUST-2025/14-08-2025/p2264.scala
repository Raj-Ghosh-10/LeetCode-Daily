object Solution {
    def largestGoodInteger(num: String): String = {
        num.toCharArray.sliding(3).filter {
            case Array(v1, v2, v3) => v1 == v2 && v1 == v3
        }.map(_.mkString).maxOption.getOrElse("")
    }
}