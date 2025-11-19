object Solution {
    def isOneBitCharacter(bits: Array[Int]): Boolean = {
        var i = 0
        while (i < bits.length - 1) if (bits(i) == 1) i += 2 else i += 1
        i == bits.length - 1
    }
}