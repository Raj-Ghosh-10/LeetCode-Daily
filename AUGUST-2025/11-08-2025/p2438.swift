class Solution {
    let MOD = 1_000_000_007
    func productQueries(_ n: Int, _ queries: [[Int]]) -> [Int] {
        let powers = getPowers(n)
        var result = [Int](repeating: 1, count: queries.count)
        
        // Simple query manipulation after finding the powers
        var idx = 0
        for query in queries {
            var temp = 1
            for i in query[0]...query[1] {
                temp = (temp * powers[i])%MOD
            }
            result[idx] = temp
            idx += 1
        }
        return result
    }

    func getPowers(_ n: Int) -> [Int] {
        // Get all the powers of 2 which are less than 10^9
        var powerArr: [Int] = []
        var temp: Int = 1
        while temp <= MOD {
            powerArr.append(temp)
            temp = temp * 2
        }

        // find the powers array by just subtracting the largest power of 2 each time
        var i = powerArr.count - 1
        var powers = [Int]()
        var n = n
        while n != 0 {
            if powerArr[i] <= n { 
                powers.append(powerArr[i])
                n -= powerArr[i]
            }
            i -= 1
        }
        return powers.reversed()
    }
}