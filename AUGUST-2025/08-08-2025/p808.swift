class Solution {
    func soupServings(_ n: Int) -> Double {

        guard n < 5000 else { return 1 }

        var cache = [Int: [Int: Double]]()
        
        func sim(_ a: Int = n, _ b: Int = n) -> Double {
            let a = max(a, 0)
            let b = max(b, 0)

            if let c = cache[a]?[b] { return c }
            let res: Double
            
            switch (a, b) {
            case (0, 0): res = 0.5
            case (0, _): res = 1
            case (_, 0): res = 0
            default: res = (
                sim(a - 100, b) +
                sim(a - 75, b - 25) +
                sim(a - 50, b - 50) +
                sim(a - 25, b - 75)
            ) / 4
            }

            cache[a, default: [:]][b] = res
            return res
        }

        return sim()
    }
}