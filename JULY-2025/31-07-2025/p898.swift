class Solution {
    func subarrayBitwiseORs(_ arr: [Int]) -> Int {
        let n = arr.count
        var res: [Int] = []
        
        for i in 0..<n{
            var or = 0
            for j in i..<n{
                or = or | arr[j]
                if or != res.last{
                    res.append(or)
                }
            }
        }
        
        return Set(res).count
    }
}