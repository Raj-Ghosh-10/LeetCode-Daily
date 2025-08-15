object Solution {
    def isPowerOfFour(n: Int): Boolean = {
        if (n <= 0) false
        else {
            val bits = n.asBits
            bits.count(_ == 1) == 1 && bits.head == 1 && bits.length % 2 == 1
        }
    }

    implicit class ToBits(i: Int) {
        def asBits: List[Int] = loop(i, List[Int]())
        def loop(value: Int, list: List[Int]): List[Int] = {
            if (value < 1) list
            else loop(value >> 1, (value & 1) +: list)
        }
    }
}