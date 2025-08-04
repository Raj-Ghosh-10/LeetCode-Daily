class Solution {
    func totalFruit(_ fruits: [Int]) -> Int {
        guard fruits.count > 2 else { 
            return fruits.count
        }
        let basket1Start = 0
        guard let basket2Start = fruits.firstIndex(where: { $0 != fruits[basket1Start] }) else { 
            return fruits.count
        }
        var basket1 = (basket1Start, basket2Start - 1)
        var basket2 = (basket2Start, basket2Start)

        var maxCount = basket2.1 - basket1.0 + 1
        for i in basket2.1..<fruits.count {
            switch fruits[i] {
            case fruits[basket1.0]:
                // extend 1 basket
                basket1.1 = i
                maxCount = max(maxCount, i - basket1.0 + 1)
            case fruits[basket2.0]:
                // extend 2 basket
                basket2.1 = i
                maxCount = max(maxCount, i - basket1.0 + 1)
            default:
                // drop both baskets and create 2 new
                // keep basket1Start < basket2Start to simplify getting maxCount
                basket1 = if basket1.1 > basket2.1 {
                    // last seen fruit is from basket 1
                    // new basket will consist of its fruits
                    // drop all fruits from basket 2
                    (basket2.1 + 1, basket1.1)
                } else {
                    // last seen fruit is from basket 2
                    // new basket will consist of its fruits
                    // drop all fruits from basket 1
                    (basket1.1 + 1, basket2.1)
                } 
                basket2 = (i, i)
            }
        }
        return maxCount
    }
}