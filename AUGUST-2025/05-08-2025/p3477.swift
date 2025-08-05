class Solution {
    func numOfUnplacedFruits(_ fruits: [Int], _ baskets: [Int]) -> Int {
        var baskets = baskets
        for i in fruits {
            fetchBasket(i,&baskets)
        }
        return baskets.count
    }
    func fetchBasket(_ fruit:Int, _ basketArr: inout [Int]) {
        for i in 0..<basketArr.count {
            if(basketArr[i] >= fruit) {
                basketArr.remove(at:i)
                break
            }
        }
    }
}