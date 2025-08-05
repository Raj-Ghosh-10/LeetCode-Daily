func numOfUnplacedFruits(fruits []int, baskets []int) int {
    ans := 0
    for i:=0; i<len(fruits); i++{
        for j:=0; j<len(baskets);j++{
            if fruits[i] <= baskets[j]{
                baskets[j] = -1
                break
            }else if j == len(baskets)-1{
                ans++
            }
        }
    }
    return ans
}