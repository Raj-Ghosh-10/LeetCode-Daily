class Solution {
    fun maximumGain(s: String, x: Int, y: Int): Int {
        var a = 0
        var b = 0
        var total = 0
        val ArrChar = s.toCharArray()
        for(ch in ArrChar) {
            if(ch != 'a' && ch != 'b') {
            	var min = Math.min(a, b)
                if(y >= x) total += x * min
                else total += y * min
                a = 0; b = 0
            } 
            else {
                if(y >= x) {
                    if(ch == 'a') {
                        if(b != 0) {
                            total += y
                            b--
                        }
                        else a++
                    }
                    else b++
                } 
                else {
                    if(ch == 'b') {
                        if(a != 0){
                            total += x
                            a--
                        }
                        else b++
                    } else a++
                }
            }
        }
    	var min = Math.min(a, b)
        if(y >= x) total += x * min
        else total += y * min
        return total
    }
}