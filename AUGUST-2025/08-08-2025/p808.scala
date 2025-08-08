object Solution {
    def soupServings(n: Int): Double =
        if (n >= 4800) 1.0
        else {
            val memo = Array.ofDim[Double](n+1, n+1)
            def serve(a: Int, b: Int): Double =
            if (a <= 0 && b <= 0) 0.5
            else if (a <= 0) 1.0
            else if (b <= 0)  0.0
            else if (memo(a)(b) > 0) memo(a)(b)
            else {
                memo(a)(b) = 0.25 * (serve(a-100,b) + serve(a-75,b-25) + serve(a-50,b-50) + serve(a-25,b-75))
                memo(a)(b)
            }
            serve(n,n)
        }
}